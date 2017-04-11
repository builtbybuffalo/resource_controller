require_dependency "app/controllers/admin/base_controller_decorator"
module Admin
  class BaseController < ApplicationController
    self.responder = AdminResponder
    layout "admin"
  end
end
