class UserPresenter < ApplicationPresenter
  def roles
    Enums.user_roles
  end
end