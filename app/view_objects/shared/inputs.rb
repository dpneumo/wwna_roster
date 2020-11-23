class Shared::Inputs
  include ActionView::Helpers::TagHelper
  attr_accessor :output_buffer

  def initialize(form)
    @form = form
  end

  def text(field)
    content_tag :div, class: "form-group col-3" do
      @form.label(field) +
      @form.text_field(field, class: "form-control")
    end
  end

  def textarea(field)
    content_tag :div, class: "form-row" do
      content_tag :div, class: "form-group col-9" do
        @form.label(field) +
        @form.text_area(field, class: "form-control")
      end
    end
  end

  def select(field, collection)
    content_tag :div, class: "form-group col-3" do
      @form.label(field) +
      @form.select( field, collection,
                    {include_blank: true},
                    {class: "form-control"})
    end
  end

  def row(fields)
    content_tag :div, class: "form-row" do
      columns(fields)
    end
  end

  def columns(fields)
    fields.map {|field| text(field) }.join.html_safe
  end
end
