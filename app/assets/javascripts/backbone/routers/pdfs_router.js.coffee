class Mimir.Routers.PdfsRouter extends Backbone.Router
  initialize: (options) ->
    @pdfs = new Mimir.Collections.PdfsCollection()
    @pdfs.reset options.pdfs

  routes:
    "new"      : "newPdf"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newPdf: ->
    @view = new Mimir.Views.Pdfs.NewView(collection: @pdfs)
    $("#pdfs").html(@view.render().el)

  index: ->
    @view = new Mimir.Views.Pdfs.IndexView(pdfs: @pdfs)
    $("#pdfs").html(@view.render().el)

  show: (id) ->
    pdf = @pdfs.get(id)

    @view = new Mimir.Views.Pdfs.ShowView(model: pdf)
    $("#pdfs").html(@view.render().el)

  edit: (id) ->
    pdf = @pdfs.get(id)

    @view = new Mimir.Views.Pdfs.EditView(model: pdf)
    $("#pdfs").html(@view.render().el)
