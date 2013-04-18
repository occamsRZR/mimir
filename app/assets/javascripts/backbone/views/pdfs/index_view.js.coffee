Mimir.Views.Pdfs ||= {}

class Mimir.Views.Pdfs.IndexView extends Backbone.View
  template: JST["backbone/templates/pdfs/index"]

  initialize: () ->
    @options.pdfs.bind('reset', @addAll)

  addAll: () =>
    @options.pdfs.each(@addOne)

  addOne: (pdf) =>
    view = new Mimir.Views.Pdfs.PdfView({model : pdf})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(pdfs: @options.pdfs.toJSON() ))
    @addAll()

    return this
