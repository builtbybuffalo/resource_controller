require "resource_controller/version"

module ResourceController
  if defined?(Rails)
    require "resource_controller/engine"
  end
end
