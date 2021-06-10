module Decorators::Input

  def form=(form)
    @form = form
  end

  def form
    @form
  end

  def input_row(fields)
    h.content_tag :div, class: "form-row" do
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

  # text accepts: label, width
  def text(f)
    h.content_tag :div, class: "form-group col-#{ f[:width] || wtxt }" do
      @form.label( f[:attribute], f[:label] ) +
      @form.text_field( f[:attribute], class: "form-control" )
    end
  end

  # textarea accepts: label, width
  def textarea(f)
    h.content_tag :div, class: "form-group col-#{ f[:width] || wtxtarea }" do
      @form.label( f[:attribute], f[:label] ) +
      @form.text_area( f[:attribute], rows: f[:rows], class: "form-control" )
    end
  end

  # checkbox accepts: label, width
  def checkbox(f)
    h.content_tag :div, class: "form-check form-check-inline col-#{ f[:width] || wckbox } mb-3" do
      @form.check_box( f[:attribute], class: "form-check-input" ) +
      @form.label( f[:attribute], f[:label], class: "form-check-label" )
    end
  end

  # date_select accepts: label, width
  def date_select(f)
    h.content_tag :div, class: "form-group col-#{ f[:width] || wdtsel }" do
      @form.label( f[:attribute], f[:label] ) + " " +
      @form.date_select( f[:attribute], class: "form-control" )
    end
  end

  # select accepts: label, width, collection, selected, blank, disabled
  def select(f)
    rslt = h.content_tag :div, class: "form-group col-#{ f[:width] || wsel }" do
      @form.label( f[:attribute], f[:label] ) +
      @form.select( f[:attribute], f[:collection],
                    { include_blank: f[:blank], selected: f[:selected] },
                    { class: "form-control",
                      multiple: f[:multiple], disabled: f[:disabled] } )
    end
    hdn = f[:disabled] ? hidden(f) : ""
    rslt+hdn
  end

  # hidden accepts: value
  def hidden(f)
    @form.hidden_field( f[:attribute], value: f[:value] ) if f[:value]
  end

private
  def wtxt; 3; end
  def wtxtarea; 9; end
  def wckbox; 3; end
  def wdtsel; 4; end
  def wsel; 3; end
end
