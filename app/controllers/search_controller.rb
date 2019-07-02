class SearchController < ApplicationController
  def index
    @exams = Exam.search(params[:term]).paginate page: params[:page], per_page: 4
  end
end
