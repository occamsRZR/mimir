# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  PDFJS.disableWorker = true
  pageNum = window.location.hash
  PDFJS.getDocument('/starlings.pdf').then (pdf) =>
    renderPage(pageParam(), pdf)

  renderPage = (pageNumber, pdf) =>
    pdf.getPage(pageNumber).then (page) =>
      scale = 1.5
      viewport = page.getViewport(scale)
      # prepare canvase using PDF page dimensions
      canvas = $("#pdf-canvas")[0]
      context = canvas.getContext('2d')
      canvas.height = viewport.height
      canvas.width = viewport.width
      # render PDF page into canvas context
      renderContext = 
        canvasContext: context
        viewport: viewport
      page.render(renderContext)

  pageParam = () =>
    result = window.location.hash.match(/\#(\d+)/)[1]