React = require('react')
Speakers = React.createFactory(require('./speakers/speakers'))

div = document.createElement('div')
document.body.insertBefore(div, document.body.firstChild)

React.render(Speakers(), div)
