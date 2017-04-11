module TemplateHelper
  def partial_exists?(name)
    lookup_context.template_exists? name, controller._prefixes, true
  end
end
