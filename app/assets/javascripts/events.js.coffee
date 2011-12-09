$(->
  $('.schedule_date_time').datetimepicker dateFormat: 'yyyy/mm/dd HH:MM'
  $('.schedule_date').datepicker dateFormat: 'yy/mm/dd'

  $('.stage_add').bind('click', ->
    dom = $('.stage:visible').last().clone(true)
    $('input:text', dom).each ->
      id = $(@).attr('id')
      count = Number(id.match /\d/)+1
      name = $(@).attr('name')
      $(@).attr('id', id.replace(/\d/, count))
      $(@).attr('name',name.replace(/\d/, count))
      $(@).val('')

    datetime= $('.schedule_date_time', dom)
    datetime.unbind()
    datetime.removeClass()
    count = Number(datetime.attr('id').match(/\d/))
    datetime_class = 'datetime' + count
    datetime.addClass(datetime_class)
    datetime.addClass('schedule_date_time')
    $('.'+datetime_class, dom).datetimepicker(dateFormat: 'yyyy/mm/dd HH:MM')

    $('.stage').last().after(dom)
    toggle_delete()
  )

  $('.stage_delete').bind('click', ->
    $('[id$=_destroy]',$(@).closest('.stage')).val true
    $(@).closest('.stage').hide()
    toggle_delete()
  )

  toggle_delete()
)

toggle_delete = ->
  if $('.stage:visible').size() != 1
    $('.stage_delete').removeAttr('disabled')
  else
    $('.stage_delete').attr('disabled', 'disabled')