#= require jquery
#= require jquery_ujs
#= require jquery-ui-sortable
#= require nested_form_fields
#= require ckeditor/init
#= require quill/quill
#= require admin/check-json
#= require admin/sortable
#= require select2-full
#= require bootstrap
#= require bootstrap-datepicker

$.fn.datepicker.defaults.format = "dd/mm/yyyy";

$(".js-select2").select2
  theme: "bootstrap"
