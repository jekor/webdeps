import postcss from 'postcss';
import valueParser from 'postcss-value-parser';
import * as fs from 'fs';

export function deps (file: string, assetPath: (a: string) => string | null, link: ((a: string) => string) | null): [Set<string>, string] {
  let source = fs.readFileSync(file).toString();
  let occurrences: [string, string, number][] = [];
  postcss.parse(source).walk(node => {
    switch (node.type) {
      case 'atrule':
        if (node.name === 'import') {
          const ast = valueParser(node.params);
          if (ast.nodes[0]) {
            if (ast.nodes[0].type === 'string') {
              const path = assetPath(ast.nodes[0].value);
              if (path) {
                occurrences.push([ast.nodes[0].value, path,
                                 // @ts-ignore
                                 node.source.start.offset + '@'.length + node.name.length + node.raws.afterName.length + ast.nodes[0].sourceIndex + '"'.length]);
              }
            } else if (ast.nodes[0].type === 'function' && ast.nodes[0].value === 'url' && ast.nodes[0].nodes.length > 0) {
              const path = assetPath(ast.nodes[0].nodes[0].value);
              if (path) {
                occurrences.push([ast.nodes[0].nodes[0].value, path,
                                  // @ts-ignore
                                  node.source.start.offset + '@'.length + node.name.length + node.raws.afterName.length + ast.nodes[0].nodes[0].sourceIndex +
                                  (ast.nodes[0].nodes[0].type === 'string' ? 1 : 0)]);
              }
            }
          }
        }
        break;
      case 'decl':
        valueParser(node.value).walk(n => {
          if (n.type === 'function' && n.value === 'url' && n.nodes.length > 0) {
            const path = assetPath(n.nodes[0].value);
            if (path) {
              occurrences.push([n.nodes[0].value, path,
                                // @ts-ignore
                                node.source.start.offset + node.prop.length + node.raws.between.length + n.nodes[0].sourceIndex + (n.nodes[0].type === 'string' ? 1 : 0)]);
            }
          }
        });
        break;
    }
  });
  if (link) {
    const [offset, segments] = occurrences.reduce(([o, ss]: [number, string[]], [value, path, offset]): [number, string[]] => {
      ss.push(source.substring(o, offset));
      offset += value.length;
      try {
        value = value.replace(path, link(path));
      } catch (_) {
        console.error(`Warning: no replacement found for "${path}"`);
      }
      ss.push(value);
      return [offset, ss];
    }, [0, []]);
    segments.push(source.substring(offset));
    source = segments.join('');
  }
  return [new Set(occurrences.map(x => x[1])), source];
}
