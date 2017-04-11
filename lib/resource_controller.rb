require "resource_controller/version"
require "kaminari"

module ResourceController
  if defined?(Rails)
    require "resource_controller/engine"
  end
end
