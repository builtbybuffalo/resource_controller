module Admin
  class BaseController < ApplicationController
    self.responder = AdminResponder
    layout "admin"
  end
end
