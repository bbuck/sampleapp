# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  maxChars = 140
  medium = Math.round maxChars * .4
  high = Math.round maxChars * .15

  countEl = $ "#char-count"
  countEl.text maxChars

  textArea = $ "textarea#micropost_content"
  handler = ->
    count = textArea.val().length
    if count > maxChars
      value = textArea.val()
      value = value.substring 0, maxChars
      count = value.length
      textArea.val value
    remaining = maxChars - count
    if remaining < high
      countEl.addClass("high").removeClass("medium")
    else if remaining < medium
      countEl.addClass("medium").removeClass("high")
    else
      countEl.removeClass("medium").removeClass("high")

    countEl.text remaining
  interval = null

  if textArea.length > 0
    textArea.focus ->
      interval = setInterval handler, 10

    textArea.blur ->
      clearInterval interval