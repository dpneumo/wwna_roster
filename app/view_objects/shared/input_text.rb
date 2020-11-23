class Shared::InputText
  def initialize(form)
    @form = form
  end

  def call(field)
    @form.label(field, class: "col-sm-1 col-form-label") +
    @form.text_field(field, class: "col-sm-2")
  end
end
