class UsersController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to user_path(@user)
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy
  end

  private

  def get_user
    @user = User.all.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :age, :email, :username, :password)
  end
end
