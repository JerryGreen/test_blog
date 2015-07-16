class ProjectsController < ApplicationController
  # before_action :authenticate_user!

  # before_filter :authenticate_user!

  # load_and_authorize_resource

  def index
    @projects = Project.all
    @users = User.all
    # authorize! :read, @projects
  end

  def show
    @project = Project.find(params[:id])
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

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
    def user_params
      params[:project].permit(:name, :description, :user_id)
    end
end
