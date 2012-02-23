window.init_viewport = ->
  window.viewport_width = $('#field').width();
  window.viewport_height = $('#field').height();

window.request_visible_objects = ->
  $.post "/players/objects",
    width: window.viewport_width
    height: window.viewport_height