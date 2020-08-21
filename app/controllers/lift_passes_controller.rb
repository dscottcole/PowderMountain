class LiftPassesController < ApplicationController
  before_action :get_lift_pass, only: [:show, :edit, :update, :destroy]
  before_action :log_check, only: [:index, :new, :create, :show, :edit, :update, :destroy]



  def index
    @lift_passes = LiftPass.all
  end

  def new
    @lift_pass = LiftPass.new
  end

  def create
    if params[:lift_pass][:start_date].empty? || params[:lift_pass][:end_date].empty?
      flash[:error] = [Lift_Pass_Date_Range_Error: "Please ensure that none of the lift pass dates are empty."]
      redirect_to new_reservation_path
    else
      @lift_pass = LiftPass.new(start_date: lift_pass_params[:start_date], end_date: lift_pass_params[:end_date], duration: calculate_duration, price: lift_price, user_id: current_user.id)
      if @lift_pass.valid?
        @lift_pass.save
        flash[:notice] = "Your Lift Pass Reservation was created. Continue to reserve your gear & lodging if you need it."
        session[:lift_pass] = @lift_pass
        redirect_to new_reservation_path
      else
        flash[:error] = @lift_pass.errors.messages
        redirect_to new_reservation_path
      end
    end
  end

  def show
    if current_user.id != @lift_pass.user.id && current_user.admin? == false
      flash[:error] = "You can only view your own lift passes."
      redirect_to home_path
    end
  end

  def edit
    if @lift_pass.start_date >= Date.today

    else
      flash[:error] = "Your lift pass has lapsed and cannot be edited."
      redirect_to lift_pass_path(@lift_pass.id)
    end

  end

  def update
    
    @lift_pass.attributes = {:start_date => lift_pass_params[:start_date], :end_date => lift_pass_params[:end_date], :duration => calculate_duration, :price => lift_price, :user_id => current_user.id}


    if @lift_pass.valid?
      @lift_pass.save
      flash[:notice] = "Successfully updated lift pass!"
      @lift_pass.reservation.attributes = {:total_cost => @lift_pass.reservation.calculate_cost}
      
      if @lift_pass.reservation.lodging_id.nil?
        @lift_pass.reservation.attributes = {:start_date => lift_pass_params[:start_date], :end_date => lift_pass_params[:end_date]}
      end
      
      @lift_pass.reservation.save
      redirect_to lift_pass_path(@lift_pass.id)
    else
      flash[:error] = @lift_pass.errors.messages
      redirect_to edit_lift_pass_path(@lift_pass.id)
    end

  end

  def destroy
    byebug
    session[:lift_pass] = nil
    @lift_pass.destroy
    redirect_to home_path
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
