#= require jquery
#= require jquery_ujs
#= require jquery-ui-sortable
#= require nested_form_fields
#= require ckeditor/init
#= require ckeditor/config
#= require quill/quill
#= require admin/check-json
#= require admin/sortable
#= require select2-full
#= require bootstrap
#= require bootstrap-datepicker

$.fn.datepicker.defaults.format = "yyyy-mm-dd";

$(".js-select2").select2
  theme: "bootstrap"
