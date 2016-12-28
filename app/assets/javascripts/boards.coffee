# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(document).ready ->
  #Display/hide addTicket Form on click on the btn
  jQuery('.addTicketBtn').click ->
    formTag = jQuery(this).parent().find('.addTicketForm')
    formTag.toggle()
    if formTag.is(":visible")
      jQuery(this).html('Réduire')
    else
      jQuery(this).html('Ajouter un ticket')
    return
  return
