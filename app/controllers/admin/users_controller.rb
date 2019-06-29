class Admin::UsersController < ApplicationController
  layout "admin/application"
  before_action :verify_admin
  before_action :find_user, only:[:destroy]

  def index
    @users = User.paginate page: params[:page], per_page: 10
  end

  def destroy
    @user.destroy
    flash[:now] = I18n.t ".controller.admin.users.success"
    redirect_to admin_users_path
  end

  private

  def find_user
    @user = User.find params[:id]
  end
end
