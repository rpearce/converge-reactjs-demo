React = require('react')
{div, h3, p} = React.DOM

Info = React.createClass
  displayName: 'SpeakerInfo'

  render: ->
    div className: 'speakerInfo',
      h3 null, @props.speaker.name
      p null,
        div null, @props.speaker.work
        div null, @props.speaker.twitter
      p null, @props.speaker.bio

module.exports = Info
