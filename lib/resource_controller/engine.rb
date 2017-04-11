module ResourceController
  class Engine < ::Rails::Engine
    config.autoload_paths += Dir["#{config.root}/app/**/"]
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
		config.assets.precompile += %w(admin.scss admin.coffee)
    config.action_view.default_form_builder = "FormBuilder"
  end
end
