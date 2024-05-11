class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    session[:user_id] ||= SecureRandom.uuid
  end
end
