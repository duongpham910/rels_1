class ResultsController < ApplicationController
  def show
  end

  def index
    exam_user_tested = Result.where(user_id: current_user.id).pluck(:exam_id).uniq
    load_score exam_user_tested
  end

  def new
    @result = Result.new
    @exam = Exam.find params[:id]
  end

  def create
    @result = Result.new result_params
    if @result.save
      flash[:success] = I18n.t "controllers.results.success"
      redirect_to exams_path
    else
      flash[:danger] = I18n.t "controllers.results.fails"
      redirect_to exams_path
    end
  end

  private

  def result_params
    params.require(:results).permit(:user_id, :exam_id, :question_id, :answer_id, :respond_id)
  end

  def load_score exam_user_tested
    @hash_score = {}
    exam_user_tested.each do |exam_id|
      @hash_score[exam_id] = {
        exam_name: Exam.find(exam_id).subject.name, 
        subject_name: Exam.find(exam_id).name, 
        score: Result.where(exam_id: exam_id).map{|i| i.answer.correct_answer}.count(true)
      }
    end
  end
end
