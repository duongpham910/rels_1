class ResultsController < ApplicationController
  
  def new
    @result = Result.new
    @exam = Exam.find params[:exam_id]
  end

  def create
    @result = Result.new result_params
    if @result.save
      flash[:danger]=I18n.t "controllers.results.success"
      redirect_to exams_path
    else
      flash[:danger]=I18n.t "controllers.results.fails"
      redirect_to exams_path
    end
  end

  private

  def result_params
    params.require(:result).permit(:user_id, :question_id, :exam_id, :answer_id)
  end
end
