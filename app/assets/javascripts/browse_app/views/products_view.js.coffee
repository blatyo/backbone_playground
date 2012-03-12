class BrowseApp.Views.ProductsView extends Backbone.View
  el: "#products"

  initialize: (options) ->
    _.bindAll @, 'render', 'addAll', 'addOne'

  render: ->
    @addAll()

  addAll: ->
    @collection.each(@addOne)

  addOne: (product) ->
    view = new BrowseApp.Views.ProductView model: product
    @$el.append(view.render().el)


