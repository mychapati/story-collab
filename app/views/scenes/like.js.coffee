$ ->
  $lb = $('#scene_<%= @scene.id %>_like_button')
  $lc = $('#scene_<%= @scene.id %>_like_count')
  if $lb.hasClass('loved')
    $lb.html('<i class="icon-heart"></i> Love').removeClass('loved')
  else
    $lb.html('<i class="icon-heart"></i> Loved').addClass('loved')
  $lc.text('<%= @scene.likes.size %>')
