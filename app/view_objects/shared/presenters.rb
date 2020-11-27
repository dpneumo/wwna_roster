class Shared::Presenters
  include ActionView::Helpers::TagHelper
  attr_accessor :output_buffer

  def initialize(model)
    @model = model
  end

  def show(attribute, label=nil)
    return unless attribute
    tag.div class: "col-sm" do
      tag.p do
        tag.strong do
          (label || attribute.to_s.titleize) + ": "
        end + formated_attr(attribute)
      end
    end.html_safe
  end

  def notice(notice)
    return unless notice
    tag.div class: "row" do
      tag.div class: "col-sm" do
        tag.p notice, id: "notice"
      end
    end
  end

  def show_in_row(attributes)
    tag.div class: "row" do
      attributes.collect do |attrib|
        attrib.is_a?(Array) ? show(*attrib) : show(attrib)
      end.join.html_safe
    end
  end

  def formated_attr(attribute)
    @model.send(attribute).to_s
  end
end
