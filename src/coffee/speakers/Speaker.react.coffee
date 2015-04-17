React = require('react')
classNames = require('classnames')
Constants = require('./Constants')
{div, img, h3, span} = React.DOM

Speaker = React.createClass
  displayName: 'Speaker'

  render: ->
    div className: 'speaker', style: @_buildStyle(), onClick: @_handleToggleClick,
      img className: 'speaker__image', src: @props.speaker.image
      div className: 'speaker__infoBox',
        div className: 'speaker__info',
          h3 className: 'speaker__name', @props.speaker.name
          span null, @props.speaker.work
      div(className: 'speaker__triangle', '') if @props.isSelected

  _buildStyle: ->
    {
      width: "#{100 / Constants.ITEMS_PER_ROW}%"
    }

  _handleToggleClick: ->
    selectedId = if @props.isSelected then null else @props.speaker.id
    @props.updateSelectedId(selectedId)

module.exports = Speaker
