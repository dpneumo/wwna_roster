class ApplicationController < ActionController::Base
  include Pagy::Backend

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end
end
