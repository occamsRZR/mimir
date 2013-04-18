Mimir.Views.Pdfs ||= {}

class Mimir.Views.Pdfs.PdfView extends Backbone.View
  template: JST["backbone/templates/pdfs/pdf"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
