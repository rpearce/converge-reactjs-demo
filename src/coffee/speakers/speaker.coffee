React = require('react')
classNames = require('classnames')
{div, img, h3, span} = React.DOM

Speaker = React.createClass
  displayName: 'Speaker'

  getInitialState: ->
    isSelected: false

  render: ->
    div className: 'speaker', onClick: @_handleToggleClick,
      img className: 'speaker__image', src: @props.speaker.image
      div className: 'speaker__infoBox',
        div className: 'speaker__info',
          h3 className: 'speaker__name', @props.speaker.name
          span null, @props.speaker.work

  _handleToggleClick: ->
    selectedId = if @props.isSelected then null else @props.speaker.id
    @props.updateSelectedId(selectedId)

module.exports = Speaker
