React = require('react')
Speakers = React.createFactory(require('./speakers/Speakers.react'))

div = document.createElement('div')
document.body.insertBefore(div, document.body.firstChild)

React.render(Speakers(), div)
