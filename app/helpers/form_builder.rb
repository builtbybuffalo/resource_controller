class FormBuilder < ActionView::Helpers::FormBuilder
  def errors?(method)
    @object.errors[method].present?
  end

  def errors_for(method)
    return if @object.errors[method].blank?

    @template.render "shared/field_errors", errors: @object.errors, method: method
  end

  def help_text(text)
    @template.render "shared/field_help", text: text
  end
end
