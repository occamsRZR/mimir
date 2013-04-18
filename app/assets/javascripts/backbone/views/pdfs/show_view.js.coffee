Mimir.Views.Pdfs ||= {}

class Mimir.Views.Pdfs.ShowView extends Backbone.View
  template: JST["backbone/templates/pdfs/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
