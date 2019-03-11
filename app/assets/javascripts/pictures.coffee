# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require "infinite-scroll.pkgd.min"

$(document).ready () ->
  $('#jopost').infiniteScroll
    path: '.next a'
    append: '.jo'
    history: false
