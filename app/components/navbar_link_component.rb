# frozen_string_literal: true

class NavbarLinkComponent < ViewComponent::Base
  def initialize(link:)
    @link = link
  end

end
