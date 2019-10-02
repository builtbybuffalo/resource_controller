###
 * Sortable lists
 *
 * This does not automatically save the items, but instead updates an input with their position.
 * This is useful for nested forms generated from associations, GalleryItems within Gallery for instance.
 * When the user adds a form item, the positions are re-indexed.
 *
 * Because new items have no ID, they cannot be automatically saved, as the autoSort below would do.
 *
 * Looks for an input '.js-postion' and updates based on position
###
$(document).ready ->
  selector = ".js-sortable"
  targetSelector = ".js-position"
  handleSelector = ".js-handle"

  sort = $(selector)

  return false if sort.length == 0

  updateElements = (el)->
    $(el).closest(selector).find("li:visible").each (i)->
      $(@).find(targetSelector).val(i+1)

  reinitCkeditors = (el) ->
    editors = el.find("div.cke")
    editors.each (i, e) ->
      input = $(e).parent().find("textarea")
      instance = CKEDITOR.instances[input.attr("id")]
      instance.updateElement()
      CKEDITOR.remove instance
      CKEDITOR.replace input.attr("id")
      $(e).remove()

  sort
    .sortable
      stop: (event, ui) ->
        updateElements(ui.item)
        reinitCkeditors(ui.item)
      handle: handleSelector
    .on "fields_added.nested_form_fields", (event, param) ->
      updateElements(event.target)
    .on "fields_removed.nested_form_fields", (event, param) ->
      updateElements(event.target)

###
 * Automatically Sortable lists
 *
 * Copied over from Spree. Requires a little setup, check FAQ Categories index.
 *
 * acts_as_list on the model
 * collection route to upate_positions nested on route, then added to data-sortable-link attribute
 * data attribute "data-row-id" set to the individual rows dom_id
###
$(document).ready ->
  selector = "[data-sortable-link]"
  handleSelector = ".js-handle"
  autoSort = $(selector)

  return false if autoSort.length == 0

  # Without this the entire table is selected
  if (autoSort.is("table"))
    autoSort = autoSort.find("tbody")

  children = {}
  autoSort.sortable
    axis: "y"
    revert: true
    cursor: "move"
    handle: handleSelector
    opacity: 0.6
    start: (e, ui) ->
      ui.placeholder.height ui.helper.outerHeight()
    helper: (e, ui) ->
      ui.children().each ->
          $(this).width $(this).width()
      ui
    update: (event, ui) ->
      parts = /(\w+_?)+_(\d+)/.exec($(ui.item).data("row-id"))

      return unless parts

      $.ajax
        type: "POST"
        dataType: "json"
        url: $(ui.item).closest(selector).data("sortable-link")
        data:
          id: parts[2]
          position: ($(ui.item).closest(selector).find("[data-row-id]").index(ui.item) + 1)
