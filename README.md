# converge-reactjs-demo
Demo for Converge talk on ReactJS

## Demo
[http://robertwpearce.com/converge-reactjs-demo](http://robertwpearce.com/converge-reactjs-demo)

## Using
```bash
$ make
$ python -m SimpleHTTPServer 8000
```

And then navigate in your browser to
```
http://localhost:8000/
```

## Development
Easy removal of `build/` file:
```bash
$ make clean
```

Build the Sass:
```bash
$ make sass
```

Watch the Sass for changes:
```bash
$ make watch_sass
```

Build the CoffeeScript:
```bash
$ make coffee
```

Watch the CoffeeScript for changes:
```bash
$ make watch_coffee
```
