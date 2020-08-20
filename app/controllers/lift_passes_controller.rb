class LiftPassesController < ApplicationController
  before_action :get_lift_pass, only: [:show, :edit, :update, :destroy]
  before_action :log_check, :admin_check, only: [:destroy]
  before_action :log_check, only: [:new]



  # def index
  #   @lift_passes = LiftPass.all
  # end

  def new
    @lift_pass = LiftPass.new
  end

  def create
    if params[:lift_pass][:start_date].empty? || params[:lift_pass][:end_date].empty?
      flash[:error] = [Lift_Pass_Date_Range_Error: "Please ensure that none of the lift pass dates are empty."]
      redirect_to new_reservation_path
    else
      @lift_pass = LiftPass.new(start_date: lift_pass_params[:start_date], end_date: lift_pass_params[:end_date], duration: calculate_duration, price: lift_price, user_id: current_user.id )
      if @lift_pass.valid?
        @lift_pass.save
        flash[:notice] = "Your Lift Pass Reservation was created. Continue to reserve your gear & lodging if you need it. Finalize Reservation if you only want to use the lift."
        session[:lift_pass] = @lift_pass
        redirect_to new_reservation_path
      else
        flash[:error] = @lift_pass.errors.messages
        redirect_to new_reservation_path
      end
    end
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
