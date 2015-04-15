React = require('react')
_ = require('lodash')
Info = React.createFactory(require('./Info.react'))
Speaker = React.createFactory(require('./Speaker.react'))
{div} = React.DOM

Row = React.createClass
  displayName: 'SpeakerRow'

  render: ->
    # Because you must return a single
    # DOM function/element.
    div null,
      @_renderRow()

  # Render each row of `Speaker`s.
  # If the row contains the currently selectedId,
  # then push the `Info` component on to the array
  # and return the array.
  _renderRow: ->
    selectedItems = @props.row.filter((item) => item.id is @props.selectedId)
    rendered = @props.row.map (item) =>
      Speaker(
        key: item.id
        isSelected: item.id is @props.selectedId
        speaker: item
        updateSelectedId: @props.updateSelectedId
      )
    rendered.push(Info(speaker: selectedItems[0])) if selectedItems.length > 0
    rendered

module.exports = Row
