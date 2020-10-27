require 'test_helper'

class SubtableHeaderTest < ActiveSupport::TestCase

  test "the partial renders well" do
    form_builder = ActionView::Helpers::FormBuilder.new(:f, @email, self, {})

    render  partial: 'shared/subtable_header',
            locals: { f: form_builder,
                      name: "Email",
                      path: :new_email_path,
                      k:    "person_id",
                      v:    @person.id }

    assert_select '*'
  end

end
