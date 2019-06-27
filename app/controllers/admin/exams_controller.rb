class Admin::ExamsController < ApplicationController
  layout "admin/application"

  def index
    @exams = Exam.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @exam = Exam.find params[:id]
    @exam.destroy
    flash[:success]= I18n.t "controller.admin.exams.sucsess"
    redirect_to admin_exams_path
  end

end
