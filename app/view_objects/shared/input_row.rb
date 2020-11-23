class Shared::InputRow
  include ActionView::Helpers::TagHelper
  attr_accessor :output_buffer

  def initialize(form)
    @form = form
    @input_txt = Shared::InputText.new(@form)
  end

  def call(fields)
    content_tag :div, class: "form-group row mb-3" do
      columns(fields)
    end
  end

  def columns(fields)
    fields.map do |field|
      @input_txt.call(field)
    end.join.html_safe
  end
end
