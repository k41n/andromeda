window.init_upgrading_building = (id) ->
  if typeof(window.upgrading_intervals) == 'undefined'
    window.upgrading_intervals = {}
  clearInterval(window.upgrading_intervals["building_"+id])
  window.upgrading_intervals["building_"+id] = setInterval ()->
    try
      elem = $("#upgrading_building_"+id+"_counter")
      left = parseInt(elem.attr("data-left"))
      left = left - 1;
      elem.attr("data-left", left)
      elem.html("Осталось "+left+" секунд")
      if left <= 0
        elem.html("Готово")
        setTimeout(->
          elem.remove();
          $.ajax "/buildings/redraw/"+id
        , 2000
        )
        clearInterval(window.upgrading_intervals["building_"+id])
    catch e
      console.log(e)
  ,1000