class UsersController < ApplicationController
  before_action :current_user,:find_user, only: [:show, :edit, :update]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success]= I18n.t "controllers.users.success"
    else
      render "new"
    end
  end
  
  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = I18n.t "controllers.users.prof_updated"
      redirect_to @user
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation, :avatar)
  end

  def find_user
    @user = User.find params[:id]
  end
end
