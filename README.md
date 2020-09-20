# webdeps - find and replace web assets in web assets

## Example

### Cache busting

#### **`my.css` (original)**
```css
h1 {
  background-image: url('header-background.png');
}
```

#### **directory listing**
```
.
├── my.css
├── header-background.png → header-background.dVkX3MK.png
└── header-background.dVkX3MK.png
```

```bash
webdeps replace . my.css
```

#### **`my.css` (modified)**
```css
h1 {
  background-image: url('header-background.dVkX3MK.png');
}
```

### Dynamic build rules

You can use `webdeps list` to list dependencies of an asset, which can be useful in build tools. For
example:

#### **`Makefile`**
```Makefile
my.css : css/my.css $(shell webdeps list css/my.css)
	webdeps replace --css . < $< > $@

%.png : image/%.png
	optipng -out $@ $<
```

Running `make my.css` will ensure that any assets referenced in `my.css` are available before running
the build commands.

## Usage

```bash
webdeps --help
```

## How it works

Webdeps looks for:

### CSS

- `@import` statements and `url` function calls containing literal URLs

### JS

- `import` statements

Webdeps excludes any `data:` URIs and any URLs with hostnames you haven’t explicitly included.

## TODO

* Support HTML (i.e. `src` attribute of `img` tag, etc.).
* Support arbitrarily nested assets (CSS attributes in JS inside of HTML, etc.).
* Support asset mapping in manifest files (instead of just symlinks in directories).
* Export a PostCSS plugin.
