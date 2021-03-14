class Shared::Inputs
  include ActionView::Helpers::TagHelper

  attr_accessor :output_buffer, :wtxt, :wtxtarea, :wckbox, :wdtsel, :wsel
  def initialize(form, wtxt: 3, wtxtarea: 9, wckbox: 3, wdtsel: 4, wsel: 3)
    @form = form
    @wtxt = wtxt
    @wtxtarea = wtxtarea
    @wckbox = wckbox
    @wdtsel = wdtsel
    @wsel = wsel
  end

  def row(fields)
    content_tag :div, class: "form-row" do
      columns(fields)
    end
  end

  def columns(fields)
    fields.map do |f|
      case f[:kind]
        when :textarea;    textarea(f)
        when :checkbox;    checkbox(f)
        when :date_select; date_select(f)
        when :select;      select(f)
        when :hidden;      hidden(f)
        else text(f)
      end
    end.join.html_safe
  end

  def text(f)
    # text needs: attribute, label, width
    content_tag :div, class: "form-group col-#{ f[:width] || wtxt }" do
      @form.label( f[:attribute], f[:label] ) +
      @form.text_field( f[:attribute], class: "form-control" )
    end
  end

  def textarea(f)
    # textarea needs: attribute, label, width
    content_tag :div, class: "form-group col-#{ f[:width] || wtxtarea }" do
      @form.label( f[:attribute], f[:label] ) +
      @form.text_area( f[:attribute], rows: f[:rows], class: "form-control" )
    end
  end

  def checkbox(f)
    # checkbox needs: attribute, label, width
    content_tag :div, class: "form-check form-check-inline col-#{ f[:width] || wckbox } mb-3" do
      @form.check_box( f[:attribute], class: "form-check-input" ) +
      @form.label( f[:attribute], f[:label], class: "form-check-label" )
    end
  end

  def date_select(f)
    # date_select needs: attribute, label, width
    content_tag :div, class: "form-group col-#{ f[:width] || wdtsel }" do
      @form.label( f[:attribute], f[:label] ) + " " +
      @form.date_select( f[:attribute], class: "form-control" )
    end
  end

  def select(f)
    # select needs: attribute, label, width, collection, selected, blank, disabled
    rslt = content_tag :div, class: "form-group col-#{ f[:width] || wsel }" do
      @form.label( f[:attribute], f[:label] ) +
      @form.select( f[:attribute], f[:collection],
                    { include_blank: f[:blank], selected: f[:selected] },
                    { class: "form-control", 
                      multiple: f[:multiple], disabled: f[:disabled] } )
    end
    hdn = f[:disabled] ? hidden(f) : ""
    rslt+hdn
  end

  def hidden(f)
    # hidden needs: attribute, value
    @form.hidden_field( f[:attribute], value: f[:value] ) if f[:value]
  end
end
