require 'test_helper'
require 'ostruct'

class PresentersTest < ActiveSupport::TestCase
  setup do
    @model = OpenStruct.new()
    @input = Shared::Presenters.new(@model)
  end

  test "show creates a labeled attribute value for display" do
    @model.latitude = BigDecimal('123.123456789')
    actual = @input.show(:latitude,'Latitude')

    assert actual.include? 'Latitude:'
    assert actual.include? '123.123456789'
  end

  test "Shows a nil value attribute as empty string" do
    @model.nil_attr = nil
    expect = "<div class=\"col-sm\"><p><strong>Nil Attr: </strong></p></div>"
    assert_equal expect, @input.show(:nil_attr)
  end

  test "if label not provided the attribute name is used" do
    @model.no_label = 'a label is not provided'
    actual = @input.show(:no_label)
    assert actual.include? 'No Label'
    assert actual.include? 'a label is not provided'
  end

  test "Show uses a provided label" do
    @model.label_provided = 'label is provided'
    actual = @input.show(:label_provided, 'Party Time!')
    assert actual.include? 'Party Time!'
    assert actual.include? 'label is provided'
  end

  test "can build a notice" do
    notice = 'Awesome!'
    actual = @input.notice(notice)
    assert actual.include? 'Awesome!'
  end

  test "can show a set of attributes in a row" do
    @model.a = "Z"; @model.b = "Y"
    actual = @input.show_in_row( [ [:a], [:b,"B is here"] ] )
    assert actual.include? 'A: '
    assert actual.include? 'Z'
    assert actual.include? 'B is here: '
    assert actual.include? 'Y'
  end
end
