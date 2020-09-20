import {docopt} from 'docopt';
import * as path from 'path';
import {writeFileSync, readlinkSync} from 'fs';
import {URL} from 'url';
import * as css from './css';
import * as js from './js';
import {union} from './set';

const args = docopt(`
find and replace web assets in web assets

Usage:
  webdeps list [options] <FILE>...
  webdeps list (--js|--css) [options]
  webdeps replace [options] <DIR> <FILE>...
  webdeps replace (--js|--css) [options] <DIR>
  webdeps -h | --help
  webdeps --version

Options:
  -h, --help          Display this message.
  --version           Display the version number.
  --js                Assume files are JavaScript.
  --css               Assume files are CSS.
  --domains STRING    A comma-separated list of domain names to match.
                      By default only relative (domainless) URLs are matched.
                      Wildcards (*) are supported.

Arguments:
  <FILE>              The CSS or JavaScript file to operate on.
                      If you provide no files, stdin is used instead.
  <DIR>               The root directory where assets are stored.
                      Any assets matching symbolic links there are replaced
                      with the path they link to.

If you provide no file names as arguments, input is read from stdin.
`.trim(), {version: '0.1.0'});

function isJs(file: string): boolean {
  return args['--js'] || ['.js', '.ts'].includes(path.extname(file));
}

function isCss(file: string): boolean {
  return args['--css'] || ['.css'].includes(path.extname(file));
}

function unsupportedFile(): never {
  console.error(`unable to determine file type or unsupported file type`);
  process.exit(1);
}

const domainRegex = new RegExp('^' + (args['--domains'] ? `(${('invalid,' + args['--domains']).replace(/\*/g, '[a-zA-z0-9-]+').split(/\s*,\s*/).join('|')})` : 'invalid') + '$');

const assetPath = function (url: string): string | null {
  let absoluteUrl = null;
  try {
    absoluteUrl = new URL(url);
  } catch (_) {
    absoluteUrl = new URL(url, 'http://invalid/root/');
  }
  if (absoluteUrl.protocol !== 'data:' && domainRegex.test(absoluteUrl.hostname)) {
    return decodeURIComponent(absoluteUrl.pathname.replace(/^\/root\//, ''));
  } else {
    return null;
  }
}

let deps = new Set();
if (args['<FILE>'].length === 0) {
  args['<FILE>'].push('/dev/stdin');
}
for (const file of args['<FILE>']) {
  if (args['list']) {
    deps = isCss(file) ? union(deps, css.deps(file, assetPath, null)[0]) : (isJs(file) ? union(deps, js.deps(file, assetPath, null)[0]) : unsupportedFile());
  } else if (args['replace']) {
    const link = (f: string) => path.join(path.dirname(f), readlinkSync(path.join(args['<DIR>'], f)));
    const replaced = isCss(file) ? css.deps(file, assetPath, link)[1] : (isJs(file) ? js.deps(file, assetPath, link)[1] : unsupportedFile());
    if (file === '/dev/stdin') {
      console.log(replaced);
    } else {
      writeFileSync(file, replaced);
    }
  }
}
if (args['list']) {
  for (const dep of deps) {
    console.log(dep);
  }
}
