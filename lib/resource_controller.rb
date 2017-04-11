require "resource_controller/version"
require "kaminari"
require "bootstrap-sass"
require "bootstrap-datepicker-rails"
require "rails-jquery-ui-sortable"
require "ckeditor"
require "select2-rails"
require "acts_as_list"

module ResourceController
  if defined?(Rails)
    require "resource_controller/engine"
  end
end
