$(document).ready ->
  selector = ".js-check-json"
  errorClass = "json-error"

  check_json = (object) ->
    object.removeClass(errorClass)
    value = object.val()

    return if value == ""

    try JSON.parse(value)
    catch e then object.addClass(errorClass)

  $(selector).each ->
    check_json($(this))

  $(document).on "keyup paste", selector, ->
    check_json($(this))
