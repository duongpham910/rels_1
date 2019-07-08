class RespondsController < ApplicationController
  def show
    @respond = Respond.find params[:id]
    @results = @respond.results
  end

  def new
    @respond = Respond.new
    @respond.results.build
    @exam = Exam.find params[:id]
  end

  def create
    @respond = Respond.new respond_params
    if @respond.save
      flash[:success] = I18n.t "controllers.responds.send_completed"
      redirect_to results_path
    else
      flash[:danger] = I18n.t "controllers.responds.send_failed"
      redirect_to exams_path
    end
  end

  private
  
  def respond_params
    params.require(:respond).permit(:user_id, 
      results_attributes: [:id, :user_id, :exam_id, :question_id, :answer_id, :_destroy, :respond_id])
  end
end
