
# make-livereload

  Livereload target for Make with sane defaults.


## Installation

```
$ npm install --save-dev make-livereload
```

## Example

```Makefile
include node_modules/make-livereload/index.mk
```

Specify the source, defaulting to `*.js *.css` in the current directory.

```Makefile
LIVERELOAD_DIR = ./
LIVERELOAD_SRC = $(shell find $(LIVERELOAD_DIR) -name '*.css' -o -name '*.js')
include node_modules/make-livereload/index.mk
```

Run the livereload server:

    $ make livereload

Then run the `reload` target with watch (consider using [visionmedia's
watch](https://github.com/visionmedia/watch))

    $ watch make reload

Stop it with

    $ make livereload-stop

# License

  MIT
