class BrowseApp.Models.Attribute extends Backbone.Model
  defaults:
    type: null
    values: []

class BrowseApp.Collections.AttributesCollection extends Backbone.Collection
  model: BrowseApp.Models.Attribute
