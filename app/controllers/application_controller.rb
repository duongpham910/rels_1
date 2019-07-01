class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def verify_admin
    unless current_user.admin?
      flash[:danger] = t "controllers.admin.access_denied"
      redirect_to login_url
    end
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = I18n.t "controllers.subjects.danger"
      redirect_to login_url
    end
  end
end
