React = require('react')
_ = require('lodash')
Constants = require('./Constants')
Row = React.createFactory(require('./Row.react'))
{div} = React.DOM

Speakers = React.createClass
  displayName: 'Speakers'

  getInitialState: ->
    speakers: []
    selectedId: null

  # Go and get the list of speakers
  # asynchronously right before the
  # component mounts on the page.
  componentWillMount: ->
    @_fetchSpeakers()

  render: ->
    if @state.speakers.length > 0
      div className: 'speakers',
        @_buildRows()

    # If we don't have any speakers,
    # simply don't render anything yet!
    # Could put a loading indicator here.
    else
      null

  _fetchSpeakers: ->
    method = 'GET'
    url = 'speakers.json'
    xhr = new XMLHttpRequest()
    xhr.onreadystatechange = => @setState(speakers: JSON.parse(xhr.responseText)) if xhr.readyState is 4
    xhr.open(method, url, true)
    xhr.send()

  # Build an array of rendered
  # React Row components
  _buildRows: ->
    rows = @_groupRows()
    rows.map (row, index) =>
      Row(
        key: "row-#{index}"
        row: row
        selectedId: @state.selectedId
        updateSelectedId: @_updateSelectedId
      )

  # Break speakers in to groups of # itemsPerRow
  _groupRows: ->
    _.chunk(@state.speakers, Constants.ITEMS_PER_ROW)

  # This is the callback that is passed to each
  # `Speaker` component.
  _updateSelectedId: (selectedId) ->
    @setState(selectedId: selectedId)

module.exports = Speakers
