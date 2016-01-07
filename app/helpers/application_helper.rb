module ApplicationHelper
  def get_error_class ressource, field
    " has-error" if ressource.errors[field].any?
  end

  def get_error_message ressource, field
    ressource.errors[field].join("<br>") if ressource.errors[field].any?
  end
end