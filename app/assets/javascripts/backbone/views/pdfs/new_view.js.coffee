Mimir.Views.Pdfs ||= {}

class Mimir.Views.Pdfs.NewView extends Backbone.View
  template: JST["backbone/templates/pdfs/new"]

  events:
    "submit #new-pdf": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (pdf) =>
        @model = pdf
        window.location.hash = "/#{@model.id}"

      error: (pdf, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
