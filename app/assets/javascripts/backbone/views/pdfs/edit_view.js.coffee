Mimir.Views.Pdfs ||= {}

class Mimir.Views.Pdfs.EditView extends Backbone.View
  template : JST["backbone/templates/pdfs/edit"]

  events :
    "submit #edit-pdf" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (pdf) =>
        @model = pdf
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
