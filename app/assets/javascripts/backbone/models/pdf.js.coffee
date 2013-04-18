class Mimir.Models.Pdf extends Backbone.Model
  paramRoot: 'pdf'

  defaults:
    location: null
    page: null

class Mimir.Collections.PdfsCollection extends Backbone.Collection
  model: Mimir.Models.Pdf
  url: '/pdfs'
