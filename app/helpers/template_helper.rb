module TemplateHelper
  def partial_exists?(name, prefixes: true)
    lookup_context.template_exists? name, (prefixes ? controller._prefixes : []), true
  end
end
