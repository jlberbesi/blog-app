class ApplicationController < ActionController::Base
  before_action :set_referer
  helper_method :current_user

  private

  def set_referer
    session[:return_to] = request.referer if request.url != request.referer
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(_resource)
    users_path
  end
end
