React = require('react')
_ = require('lodash')
Constants = require('./Constants')
Info = React.createFactory(require('./Info.react'))
Speaker = React.createFactory(require('./Speaker.react'))
{div} = React.DOM

Speakers = React.createClass
  displayName: 'Speakers'

  getInitialState: ->
    speakers: []
    selectedId: null

  componentWillMount: ->
    @_fetchSpeakers()

  render: ->
    if @state.speakers.length > 0
      rows = @_groupRows().map(@_renderRow)
      div className: 'speakers', rows
    else
      null

  # Break speakers in to groups of # itemsPerRow
  _groupRows: ->
    _.chunk(@state.speakers, Constants.ITEMS_PER_ROW)

  # Render each row of `Speaker`s.
  # If the row contains the currently selectedId,
  # then push the `Info` component on to the array
  # and return the array.
  _renderRow: (row, index) ->
    selectedItems = row.filter((item) => item.id is @state.selectedId)
    rendered = row.map (item) =>
      Speaker(
        key: item.id
        isSelected: item.id is @state.selectedId
        speaker: item
        updateSelectedId: @_updateSelectedId
      )
    rendered.push(Info(speaker: selectedItems[0])) if selectedItems.length > 0
    rendered

  _fetchSpeakers: ->
    method = 'GET'
    url = 'speakers.json'
    xhr = new XMLHttpRequest()
    xhr.onreadystatechange = => @setState(speakers: JSON.parse(xhr.responseText)) if xhr.readyState is 4
    xhr.open(method, url, true)
    xhr.send()
    #@setState(speakers: speakers)

  # This is the callback that is passed to each
  # `Speaker` component.
  _updateSelectedId: (selectedId) ->
    @setState(selectedId: selectedId)

module.exports = Speakers
