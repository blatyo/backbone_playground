window.BrowseApp =
  Collections: {}
  Views: {}
  Models: {}
  Templates: {}

  init: (products)->
    products = new BrowseApp.Collections.ProductsCollection products
    attributes = {}
    products.each (product) ->
      _.each product.get('attributes'), (value, type) ->
        attributes[type] ||= []
        attributes[type].push(value)
    attrs = []
    _.each attributes, (values, type) ->
      attrs.push
        type: type
        values: _.uniq values

    attributes = new BrowseApp.Collections.AttributesCollection attrs

    products_view = new BrowseApp.Views.ProductsView collection: products
    products_view.render()

    attributes_view = new BrowseApp.Views.AttributesView collection: attributes
    attributes_view.render()

_.extend(window.BrowseApp, Backbone.Events)
