import * as ts from 'typescript';
import * as fs from 'fs';

function nodeDeps (node: ts.Node, assetPath: (a: string) => string | null): [number, number, string][] {
  switch (node.kind) {
    case ts.SyntaxKind.ImportDeclaration:
      const decl = node as ts.ImportDeclaration;
      if (decl.moduleSpecifier.kind === ts.SyntaxKind.StringLiteral) {
        const path = assetPath((decl.moduleSpecifier as ts.StringLiteral).text);
        if (path) {
          return [[decl.moduleSpecifier.pos, decl.moduleSpecifier.end, (decl.moduleSpecifier as ts.StringLiteral).text]];
        }
      }
      break;
    case ts.SyntaxKind.CallExpression:
      const expr = node as ts.CallExpression;
      if (expr.expression.kind === ts.SyntaxKind.ImportKeyword && expr.arguments.length === 1 && expr.arguments[0].kind === ts.SyntaxKind.StringLiteral) {
        return [[expr.arguments[0].pos, expr.arguments[0].end, (expr.arguments[0] as ts.StringLiteral).text]];
      }
      break;
    default:
      return node.getChildren().map(n => nodeDeps(n, assetPath)).reduce((a, v) => a.concat(v), []);
  }
  return [];
}

export function deps (file: string, assetPath: (a: string) => string | null, link: ((a: string) => string) | null): [Set<string>, string] {
  let source = fs.readFileSync(file).toString();
  const occurrences = nodeDeps(ts.createSourceFile(file, source, ts.ScriptTarget.ESNext, true), assetPath);
  if (link) {
    const [offset, segments] = occurrences.reduce(([o, ss]: [number, string[]], [start, end, path]): [number, string[]] => {
      ss.push(source.substring(o, start));
      let value = source.substring(start, end);
      try {
        value = value.replace(path, link(path));
      } catch (_) {
        console.error(`Warning: no replacement found for "${path}"`);
      }
      ss.push(value);
      return [end, ss];
    }, [0, []]);
    segments.push(source.substring(offset));
    source = segments.join('');
  }
  return [new Set(occurrences.map(x => x[2])), source];
}
