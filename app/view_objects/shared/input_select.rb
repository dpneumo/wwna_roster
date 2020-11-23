class Shared::InputSelect
  def initialize(form)
    @form = form
  end

  def call(field, collection)
    @form.label(field, class: "col-sm-1 col-form-label") +
    @form.select( field, collection,
                  include_blank: true,
                  class: "custom-select col-sm-2")
  end
end
