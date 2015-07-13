class ProjectsController < ApplicationController
  # before_action :authenticate_user!

  before_filter :authenticate_user!

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new user_params

    if @project.save
      redirect_to projects_path
    else
      render 'new'
    end
  end

  private
    def user_params
      params[:project].permit(:name, :description, :user_id)
    end
end
