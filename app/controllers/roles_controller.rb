class RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def edit
    @role = Role.find(params[:id]) 
  end

  # POST-запрос на создание
  def create
    #render plain: params[:roles].inspect
    @role = Role.new role_params

    if @role.save
      redirect_to roles_path
    else
      render 'new'
    end
  end

  # POST-запрос на изменение
  def update
    @role = Role.find(params[:id])

    if @role.update(role_params)
      redirect_to roles_path
    else
      render 'edit'
    end
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    redirect_to roles_path
  end

  private
    def role_params
      params[:role].permit(:name)
    end
end
