class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      if !user.admin?
        redirect_to subjects_path
      else
        redirect_to admin_index_path
      end
    else
      flash.now[:danger] = I18n.t "controllers.sessions.invalid"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
