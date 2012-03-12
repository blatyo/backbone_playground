class BrowseApp.Views.AttributeTypeView extends Backbone.View
  tagName: "aside"
  className: "attribute_type"

  events:
    "click a.clear": "triggerReset"

  initialize: (options) ->
    @template = _.template $("#attribute_type").html()
    _.bindAll(@, 'render', 'addAll', 'addOne')

  render: ->
    content = @template
      type: @model.get("type")

    @$el.html content
    @addAll()

    @

  addAll: ->
    _.each @model.get("values"), @addOne

  addOne: (value) ->
    view = new BrowseApp.Views.AttributeValueView(type: @model.get('type'), model: value)
    @$("ul").append(view.render().el)

  triggerReset: ->
    BrowseApp.trigger("reset", @model.get('type'))
    @render()

