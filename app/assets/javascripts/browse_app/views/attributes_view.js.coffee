class BrowseApp.Views.AttributesView extends Backbone.View
  el: "#attributes"

  initialize: (options) ->
    _.bindAll @, 'render', 'addAll', 'addOne'

  render: ->
    @addAll()

  addAll: ->
    @collection.each(@addOne)

  addOne: (attribute) ->
    view = new BrowseApp.Views.AttributeTypeView model: attribute
    @$el.append(view.render().el)
