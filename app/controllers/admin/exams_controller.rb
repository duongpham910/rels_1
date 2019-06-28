class Admin::ExamsController < ApplicationController
  before_action :verify_admin!
  before_action :find_exam, except: [:index, :new, :create]
  
  def index
    @exams = Exam.all.paginate page: params[:page], per_page: 15
  end

  def show
  end

  def new
    @exam = Exam.new
    @exam.questions.build.answers.build
  end

  def create
    @exam = Exam.new exam_params
    if @exam.save
      flash[:success] = I18n.t "controllers.exams.successful"
      redirect_to admin_exams_path
    else
      flash[:danger] = I18n.t "controllers.exams.error"
      render "new"
    end
  end

  def edit
  end

  def update
    if @exam.update_attributes exam_params
      flash[:success] = I18n.t "controllers.exams.successful"
      redirect_to admin_exams_path
    else
      flash[:danger] = I18n.t "controllers.exams.error"
      render "edit"
    end
  end

  def destroy
    @exam.destroy
    flash[:success] = I18n.t "controllers.exams.successful"
    redirect_to admin_exams_path
  end 

  private
  def exam_params
    params.require(:exam).permit(:subject_id, :name, :duration,
      questions_attributes: [:id, :content, :_destroy,
        answers_attributes: [:id, :content, :correct_answer, :_destroy]
      ]
    )
  end

  def find_exam
    @exam = Exam.find params[:id]
  end

  def verify_admin!
    return if current_user.admin?
    flash[:danger] = I18n.t ".controller.admin.access_denied"
    redirect_to login_path
  end
end
