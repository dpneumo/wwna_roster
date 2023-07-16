# frozen_string_literal: true

class NavbarComponent < ViewComponent::Base
  def initialize(links:)
    @links = links
  end

end
