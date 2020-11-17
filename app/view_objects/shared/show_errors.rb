class Shared::ShowErrors
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::TagHelper
  attr_accessor :output_buffer

  def initialize(mdl)
    @mdl = mdl
  end

  def call
    return '' unless @mdl.errors.any?
    content_tag :div, class: "row", id:"error_explanation" do
      content_tag(:h5, label) +
      content_tag(:ul) do
        @mdl.err_msgs.map {|msg| content_tag(:li, msg).html_safe }.
        join.html_safe
      end
    end
  end

  def label
    errors_counts + ' prohibited this ' + model_name + ' from being saved:'
  end

  def errors_counts
    pluralize(@mdl.errors.count, 'error')
  end

  def model_name
    @mdl.class.name.demodulize
  end
end
