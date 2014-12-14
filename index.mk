# Include this file into your makefile to bring in the following targets:
#
# - livereload-start 						- Start the LiveReload server
# - livereload-stop 						- Stops the LiveReload server
# - livereload 									- Alias to the start target
# - reload 											- Watchable target
#
# Start the livereload server by running `make livereload` and run the
# reload target with watch by running `watch make reload`

LIVERELOAD_DIR ?= ./
LIVERELOAD_SRC ?= $(shell find $(LIVERELOAD_DIR) -name '*.css' -o -name '*.js')
DEBUG ?= tinylr:cli
DIR ?= $(dir $(lastword $(MAKEFILE_LIST)))
TINYLR := "$(PWD)"/node_modules/.bin/tiny-lr

reload: tiny-lr.pid
tiny-lr.pid: $(LIVERELOAD_SRC)
	@echo "File(s) changed: $?"
	@touch $@
	curl --ipv4 http://localhost:35729/changed?files=$(shell node -pe '"$?".split(" ").join(",")')

livereload-start:
	@echo ... Starting server, running in background ...
	@echo ... Run: "make livereload-stop" to stop the server ...
	@DEBUG=$(DEBUG) $(TINYLR) &

# Alias livereload to the start target
livereload: livereload-start

livereload-stop:
	curl --ipv4 http://localhost:35729/kill

.PHONY: livereload livereload-start livereload-stop reload
