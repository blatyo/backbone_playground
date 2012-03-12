class BrowseApp.Views.AttributeValueView extends Backbone.View
  tagName: "li"

  events:
    click: "select"

  initialize: (options) ->
    @type = options.type
    @template = _.template($('#attribute_value').html())
    _.bindAll(@, 'render', 'select', 'toggleEnabled')
    BrowseApp.on("picked", @toggleEnabled)

  render: (enabled = true) ->
    content = @template(value: @model, enabled: enabled)

    @$el.html content

    @

  select: ->
    BrowseApp.trigger("picked", type: @type, value: @model)

  toggleEnabled: (picked) ->
    if @type == picked.type
      @render(@model == picked.value)
