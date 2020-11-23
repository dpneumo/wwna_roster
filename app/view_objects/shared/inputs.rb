class Shared::Inputs
  include ActionView::Helpers::TagHelper
  attr_accessor :output_buffer

  def initialize(form)
    @form = form
  end

  def text(field)
    @form.label(field, class: "col-sm-1 col-form-label") +
    @form.text_field(field, class: "col-sm-2")
  end

  def textarea(field)
    @form.label(field, class: "col-sm-1 col-form-label") +
    @form.text_area(field, class: "col-sm-6", rows: "2")
  end

  def select(field, collection)
    @form.label(field, class: "col-sm-1 col-form-label") +
    @form.select( field, collection,
                  include_blank: true,
                  class: "custom-select col-sm-2")
  end

  def row(fields)
    content_tag :div, class: "form-group row mb-3" do
      columns(fields)
    end
  end

  def columns(fields)
    fields.map {|field| text(field) }.join.html_safe
  end
end
