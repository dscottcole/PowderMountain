class LiftPassesController < ApplicationController
  before_action :get_lift_pass, only: [:show, :edit, :update, :destroy]
  before_action :log_check, :admin_check, only: [:destroy]
  before_action :log_check, only: [:new]

  $price = 50

  def index
    @lift_passes = LiftPass.all
  end

  def new
    @lift_pass = LiftPass.new
  end

  def create
    @lift_pass = LiftPass.create(start_date: lift_pass_params[:start_date], end_date: lift_pass_params[:end_date], duration: calculate_duration, price: $price, user_id: current_user.id )
    byebug
    redirect_to lift_pass_path(@lift_pass)
  end

  def show
  end

  def edit
  end

  def update
    @lift_pass.update(lift_pass_params)
    redirect_to lift_pass_path(@lift_pass)
  end

  def destroy
    @lift_pass.destroy
  end

  private

  def get_lift_pass
    @lift_pass = LiftPass.all.find_by(id: params[:id])
  end

  def lift_pass_params
    params.require(:lift_pass).permit(:start_date, :end_date)
  end

  def calculate_duration
    (lift_pass_params[:end_date].to_date - lift_pass_params[:start_date].to_date).to_i
  end
end
