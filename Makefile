SHELL=/bin/bash

all: clean npm coffee sass

clean:
	rm -rf build/

npm:
	npm install

sass:
	mkdir -p build/
	sass src/sass/app.scss build/app.css --sourcemap=none --style=compressed

coffee:
	mkdir -p build/
	node_modules/.bin/browserify -t coffeeify --extension=".coffee" src/coffee/app.coffee > build/app.js

watch_coffee:
	node_modules/.bin/watch 'make coffee' src/coffee

watch_sass:
	node_modules/.bin/watch 'make sass' src/sass
