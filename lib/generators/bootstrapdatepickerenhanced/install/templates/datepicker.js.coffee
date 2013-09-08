# app/assets/javascripts/datepicker.js.coffee
jQuery ->
  $(document).on "focus", "[data-behaviour~='datepicker']", (e) ->
    $(this).datepicker
      language: 'de'
