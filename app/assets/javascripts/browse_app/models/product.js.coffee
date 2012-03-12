class BrowseApp.Models.Product extends Backbone.Model
  defaults:
    name: null
    attributes: null
    image_url: 'iphone4.png'

class BrowseApp.Collections.ProductsCollection extends Backbone.Collection
  model: BrowseApp.Models.Product
