class UsersController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save  
      redirect_to login_path
    else
      flash[:error] = @user.errors.messages
      redirect_to new_user_path
    end
  end

  def show
  end

  def edit

  end

  def update

    byebug
    @user.attributes = {:name => params[:user][:name], :age => params[:user][:age], :email => params[:user][:email], :username => params[:user][:username],  :password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation]}

    if @user.valid?
      @user.save
      redirect_to user_path(@user)
      byebug
    else
      flash[:error] = @user.errors.messages
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user.destroy
  end

  def login
  end

  def verify
     @user = User.find_by(username: login_params[:username])

    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      flash[:error] = "Credentials are not valid."
      redirect_to login_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def get_user
    @user = User.all.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :age, :email, :username, :password, :password_confirmation)
  end

  def login_params
    params.require(:login).permit(:username, :password)
  end
    
  
end
