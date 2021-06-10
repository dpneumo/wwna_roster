# frozen_string_literal: true

class UserPresenter < ApplicationPresenter
  def roles
    Enums.user_roles
  end
end
