# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'resource_controller/version'

Gem::Specification.new do |spec|
  spec.name          = "resource_controller"
  spec.version       = ResourceController::VERSION
  spec.authors       = ["jaspertandy"]
  spec.email         = ["jspr@tndy.me"]

  spec.summary       = %q{Admin resource controller}
  spec.description   = %q{An admin resource controller}
  spec.homepage      = "https://github.com/builtbybuffalo/resource_controller"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["app", "lib"]

  spec.add_development_dependency "bundler", ">= 2.2.10"
  spec.add_runtime_dependency 'kaminari'
  spec.add_runtime_dependency "bootstrap-sass", ">= 3.4.1"
  spec.add_runtime_dependency "bootstrap-datepicker-rails"
  spec.add_runtime_dependency "rails-jquery-ui-sortable"
  spec.add_runtime_dependency "awesome_nested_set", "~> 3.1", ">= 3.1.1"
  spec.add_runtime_dependency "ckeditor", '4.2.4'
  spec.add_runtime_dependency "select2-rails"
  spec.add_runtime_dependency "acts_as_list"
end
