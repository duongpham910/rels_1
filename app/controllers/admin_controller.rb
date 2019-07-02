class AdminController < ApplicationController
  layout "admin/application"
  before_action :verify_admin!

  def index
  end

  private

  def verify_admin!
    return if current_user.admin?
    flash[:danger] = I18n.t ".controller.admin.access_denied"
    redirect_to login_path
  end
end
