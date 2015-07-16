class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    puts "11111111111111111111111111111111111111111111111111111111111"
    # render plain: params[:users].inspect
    if can? :manage, User
      @user = User.new admin_params
    else
      @user = User.new user_params
    end

    if @user.save
      redirect_to [:admin, @user]
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
   
    if can? :manage, @user
      @user.update(admin_params)
    else
      @user.update(user_params)
    end
    redirect_to [:admin, @user]
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  private
    def admin_params
      params[:user].permit(:name, :email, :password, :password_confirmation, :role)
    end
    def user_params
      params[:user].permit(:name, :email, :password, :password_confirmation)
    end
end
