class PersonName
  def initialize(first, middle, last, nickname, suffix, honorific)
    @first, @middle, @last = first, middle, last
    @nickname, @suffix, @honorific = nickname, suffix, honorific
  end

  def fullname
    first + middle + last
  end

  def sortable_name
    last + ', ' + first + middle
  end  

  def informal_name
    nickname + last
  end

  def formal_name
    honorific + fullname + suffix
  end

private
  def nickname
    '' if @nickname.blank?
    @nickname.strip + ' '
  end

  def first
    '' if @first.blank?
    @first.strip + ' '
  end

  def middle
    '' if @middle.blank?
    @middle.strip + ' '
  end

  def last
    'Not Provided' if @last.blank?
    @last.strip
  end

  def honorific
    '' if @honorific.blank?
    @honorific.strip + ' '
  end

  def suffix
    '' if @suffix.blank?
    ' ' + @suffix.strip
  end
end
