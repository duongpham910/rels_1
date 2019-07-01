class SubjectsController < ApplicationController
  before_action :find_subject, only: [:show]
  before_action :logged_in_user, only: [:index, :show]

  def index
    @subject = Subject.new
  end

  def show
  end

  private
  def find_subject
    @subject = Subject.find(subject_params[:id])
  end

  def subject_params
    params.require(:subject).permit(:name, :id)
  end
end
