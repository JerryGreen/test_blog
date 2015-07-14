class ProjectsController < ApplicationController
  # before_action :authenticate_user!

  before_filter :authenticate_user!

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @project.user_id = current_user.id
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new user_params

    if @project.save
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])
   
    if @project.update(user_params)
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  private
    def user_params
      params[:project].permit(:name, :description, :user_id)
    end
end
