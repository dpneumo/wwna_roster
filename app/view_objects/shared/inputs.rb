class Shared::Inputs
  include ActionView::Helpers::TagHelper
  attr_accessor :output_buffer

  def initialize(form)
    @form = form
  end

  def row(fields)
    content_tag :div, class: "form-row" do
      columns(fields)
    end
  end

  def columns(fields)
    fields.map do |f|
      case f[:kind]
        when :text;               text(f[:attribute], f[:label], f[:width])
        when :hidden;           hidden(f[:attribute], f[:value])
        when :textarea;       textarea(f[:attribute], f[:label], f[:width])
        when :checkbox;       checkbox(f[:attribute], f[:label], f[:width])
        when :date_select; date_select(f[:attribute], f[:label], f[:width])
        when :select;           select(f)
        else text(f[:attribute], f[:label], f[:width])
      end
    end.join.html_safe
  end

  def text(attribute, label=nil, width=3)
    content_tag :div, class: "form-group col-#{width || 3}" do
      @form.label(attribute, label) +
      @form.text_field(attribute, class: "form-control")
    end
  end

  def hidden(attribute, value=nil)
    @form.hidden_field(attribute, value: value) if value
  end

  def textarea(attribute, label=nil, width=9)
    content_tag :div, class: "form-group col-#{width || 9}" do
      @form.label(attribute, label) +
      @form.text_area(attribute, class: "form-control")
    end
  end

  def checkbox(attribute, label=nil, width=3)
    content_tag :div, class: "form-check form-check-inline col-#{width || 3} mb-3" do
      @form.check_box(attribute, class: "form-check-input") +
      @form.label(attribute, label, class: "form-check-label")
    end
  end

  def date_select(attribute, label=nil, width=4)
    content_tag :div, class: "form-group col-#{width || 4}" do
      @form.label(attribute, label) + " " +
      @form.date_select(attribute, class: "form-control")
    end
  end

  def select(f)
    rslt = content_tag :div, class: "form-group col-#{ f[:width] || 3 }" do
      @form.label( f[:attribute], f[:label] ) +
      @form.select( f[:attribute], f[:collection],
                    { include_blank: f[:blank],
                      selected: f[:selected]    },
                    { class: "form-control",
                      disabled: f[:disabled]    } )
    end
    hdn = f[:disabled] ? hidden(f[:attribute], f[:selected]) : ""
    rslt+hdn
  end
end
