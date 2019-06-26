class SubjectsController < ApplicationController
  before_action :find_subject, only: [:edit, :update, :destroy]

  def index
    @subjects = Subject.paginate page: params[:page], per_page: 15
  end

  def new
    @subject = Subject.new
  end

  def create 
    @subject = Subject.new subject_params  
    if @subject.save
      flash[:success] = I18n.t "controllers.subjects.successful"
      redirect_to subjects_path
    else
      flash[:danger] = I18n.t "controllers.subjects.error"
      render "new"
    end 
  end

  def edit
    respond_to do |format|
      format.html 
      format.js 
    end
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = I18n.t 'controllers.subjects.successful'
      redirect_to subjects_path
    else
      flash[:danger] = I18n.t "controllers.subjects.error"
      render "edit"
    end
  end

  def destroy
    @subject.destroy
    flash[:success] = I18n.t "controllers.subjects.successful"
    redirect_to subjects_path
  end

  private
  def find_subject
    @subject = Subject.find_by params[:id]
  end

  def subject_params
    params.require(:subject).permit(:name)
  end
end
