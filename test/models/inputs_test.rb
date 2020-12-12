require 'test_helper'
require 'fixtures/files/mock_form'

class InputsTest < ActiveSupport::TestCase
  setup do
    form = MockForm.new
    @input = Shared::Inputs.new(form)
  end

  test "#text wraps label & text in form-group and col" do
    expected = '<div class="form-group col-3"><div>LBLFirst</div><div>First</div></div>'
    assert_equal expected, @input.text(attribute: :first)
  end

  test "#textarea wraps label & textarea in form-group and col" do
    expected = '<div class="form-group col-9"><div>LBLNote</div><div>Note</div></div>'
    assert_equal expected, @input.textarea(attribute: :note)
  end

  test "#date_select wraps label & date_select in form-group and col" do
    expected = '<div class="form-group col-4"><div>LBLDate</div> <div>Date</div></div>'
    assert_equal expected, @input.date_select(attribute: :date)
  end

  test "#select wraps label & select in form-group and col" do
    expected = '<div class="form-group col-3"><div>LBLRoles</div><div>Roles</div></div>'
    assert_equal expected, @input.select(attribute: :roles, collection: ['a','b'])
  end

  test "#row wraps text inputs in form-row div" do
    expected =  '<div class="form-row">'
    expected += '<div class="form-group col-4"><div>LBLFirst</div><div>First</div></div>'
    expected += '<div class="form-group col-8"><div>LBLSecond</div><div>Second</div></div>'
    expected += '<div class="form-group col-3"><div>LBLThird</div><div>Third</div></div>'
    expected += '<div class="form-check form-check-inline col-3 mb-3"><div>Fourth</div><div>LBLCheck</div></div>'
    expected += '</div>'
    actual = @input.row([ {kind: :text,     attribute: :first,  width: 4},
                          {kind: :textarea, attribute: :second, width: 8},
                          {kind: :select,   attribute: :third,  collection: ['a','b']},
                          {kind: :checkbox, attribute: :fourth, label: "Check"},            ])
    assert_equal expected, actual
  end
end
