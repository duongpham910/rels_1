class ResultsController < ApplicationController
  def show
    @result = Result.find params[:id]
    @true_result = @result.question.answers.true
  end

  def index
    exam_user_tested = Result.where(user_id: current_user.id).pluck(:exam_id).uniq
    load_score exam_user_tested
  end

  def new
    @result = Result.new
    @exam = Exam.find params[:exam_id]
  end

  def create
    @result = Result.new result_params
    if @result.save
      flash[:danger]=I18n.t "controllers.results.success"
      redirect_to @result
    else
      flash[:danger]=I18n.t "controllers.results.fails"
      redirect_to exams_path
    end
  end

  private

  def result_params
    params.require(:result).permit(:user_id, :question_id, :exam_id, :answer_id)
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
