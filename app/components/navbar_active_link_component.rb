# frozen_string_literal: true

class NavbarActiveLinkComponent < ViewComponent::Base
  def initialize(link:)
    @link = link
  end

end
