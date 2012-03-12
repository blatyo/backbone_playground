class BrowseApp.Views.ProductView extends Backbone.View
  tagName: "article"
  className: "product"

  initialize: (options) ->
    @template = _.template $("#product").html()
    @current_attributes = {}
    _.bindAll(@, 'render', 'toggleVisible', 'reset')
    BrowseApp.on("picked", @toggleVisible)
    BrowseApp.on("reset", @reset)

  render: (visible = true) ->
    content = @template
      name: @model.get("name")
      image_url: @model.get("image_url")

    @$el.html content

    return @

  toggleVisible: (picked) ->
    picked_attribute = {}
    picked_attribute[picked.type] = picked.value
    @current_attributes = _.extend @current_attributes, picked_attribute
    attributes = @model.get('attributes')
    match = _.all @current_attributes, (value, type) ->
      attributes[type] == value
    visible = @$el.is(":visible")

    if match && !visible
      @$el.fadeIn('slow')
    else if !match && visible
      @$el.parent().append(@$el)
      @$el.fadeOut('slow')

  reset: (type) ->
    delete @current_attributes[type]
    @toggleVisible({})
