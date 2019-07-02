class Admin::SubjectsController < ApplicationController
  layout "admin/application"
  before_action :verify_admin
  before_action :find_subject, except: [:index, :new, :create]

  def index
    @subjects = Subject.paginate page: params[:page], per_page: 15
  end

  def show
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = I18n.t "controller.admin.subjects.successful"
      redirect_to admin_subjects_path
    else
      flash[:danger] = I18n.t "controller.amin.subjects.error"
      render "new"
    end
  end

  def edit
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = I18n.t "controller.admin.subjects.successful"
      redirect_to admin_subjects_path
    else
      flash[:danger] = I18n.t "controller.admin.subjects.error"
      render "edit"
    end
  end

  def destroy
    @subject.destroy
    flash[:success] = I18n.t "controller.admin.subjects.successful"
    redirect_to admin_subjects_path
  end

  private
  def find_subject
    @subject = Subject.find params[:id]
  end

  def subject_params
    params.require(:subject).permit(:name, :id)
  end
end
