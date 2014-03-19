# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  # $('.datetime_picker').datetimepicker({
  #   language: 'pt-BR'
  # });
  

  $('input.tokenize').on('tokenfield:createtoken',
    (e) ->
       # Über-simplistic e-mail validation
      console.log('ssdf')
      $(e.relatedTarget).addClass('invalid')
  ).tokenfield()
