$ ->
  $(".story").empty()
    .append("<%= escape_javascript(render :partial => 'stories/header') %>")
    .append("<%= escape_javascript(render :partial => 'stories/story') %>")
  $(".scene-info-inner").click showScene
  $('#add-scene-wrapper').hide()
  setupComments()
  setupAnalytics()
  truncateSceneDesc()
