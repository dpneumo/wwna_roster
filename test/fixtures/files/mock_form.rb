class MockForm
  def initialize
  end

  def label(attribute, label=nil, html_opts=nil)
    label ||= attribute
    txt = "<div>#{'LBL'+label.to_s.capitalize}</div>"
    txt.html_safe
  end

  def text_field(attribute, options=nil)
    txt = "<div>#{attribute.to_s.capitalize}</div>"
    txt.html_safe
  end

  def text_area(attribute, options=nil)
    txt = "<div>#{attribute.to_s.capitalize}</div>"
    txt.html_safe
  end

  def check_box(attribute, html_opts=nil)
    txt = "<div>#{attribute.to_s.capitalize}</div>"
    txt.html_safe
  end

  def date_select(attribute, options=nil)
    txt = "<div>#{attribute.to_s.capitalize}</div>"
    txt.html_safe
  end

  def select(attribute, collection, method_opts=nil, html_opts=nil)
    txt = "<div>#{attribute.to_s.capitalize}</div>"
    txt.html_safe
  end
end
