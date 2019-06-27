class Admin::ExamsController < ApplicationController
  layout "admin/application"
  before_action :find_exam, only:[:edit, :update, :destroy]
  
  def index
    @exams = Exam.all.paginate page: params[:page], per_page: 15
  end

  def new
    @exam = Exam.new
    @exam.questions.build.answers.build
  end

  def create
    @exam = Exam.new exam_params
    if @exam.save
      flash[:success] = I18n.t "controllers.exams.successful"
      redirect_to 
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
      redirect_to exams_path
    else
      flash[:danger] = I18n.t "controllers.exams.error"
      render "edit"
    end
  end

  def destroy
    @exam.destroy
    flash[:success] = I18n.t "controllers.exams.successful"
    redirect_to exams_path
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

end
