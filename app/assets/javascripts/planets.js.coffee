window.setup_objects = (viewport_x, viewport_y) ->
  $('.planet').each (i,planet) ->
    x = parseInt($(planet).attr('data-x'))
    y = parseInt($(planet).attr('data-y'))
    left = window.viewport_width/2 + x - $(planet).width()/2 - parseInt(viewport_x)
    top = window.viewport_height/2 - y - $(planet).height()/2 + parseInt(viewport_y)
    $(planet).css('left', left)
    $(planet).css('top', top)

window.init_planet_update = (id) ->
  planet_id = id
  if typeof(window.planet_updating_intervals) == 'undefined'
    window.planet_updating_intervals = {}
  clearInterval(window.planet_updating_intervals[id])
  window.planet_updating_intervals[id] = setInterval(->
    $.ajax "/planets/"+planet_id+"/update_resources"
  ,10000)