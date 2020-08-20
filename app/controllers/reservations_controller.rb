class ReservationsController < ApplicationController
  before_action :get_reservation, only: [:show, :edit, :update, :destroy]
  before_action :log_check, :admin_check, only: [:index, :destroy]
  
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
    @lift_pass = LiftPass.new
    @gear_bag = GearBag.new
  end

  def create

    if session[:lift_pass] == nil && params[:reservation][:start_date].empty? && params[:reservation][:end_date].empty?
      flash[:error] = [Empty_Form: "A lift pass is the minimum requirement to make a reservation."]
      redirect_to new_reservation_path

    elsif session[:lift_pass] == nil
      flash[:error] = [Lift_pass_error: "A lift pass is required to create a reservation."]
      redirect_to new_reservation_path

    ## Just lift_pass  
    elsif session[:lift_pass] != nil && session[:gear_bag].nil? && params[:reservation][:start_date] == "" && params[:reservation][:end_date] == ""
      @reservation = Reservation.new(user_id: current_user.id, rent_eq: false, lift_pass_id: session[:lift_pass]["id"])
      @reservation.attributes = {:total_cost => @reservation.calculate_cost}

      if @reservation.valid?
        @reservation.save
        session[:lift_pass] = nil
        flash[:notice] = "Your reservation was created with just a lift pass."
        redirect_to reservation_path(@reservation.id)
      else
        flash[:error] = @reservation.errors.messages
        redirect_to new_reservation_path
      end

     ## Lift_pass & Lodging 
    elsif session[:lift_pass] != nil && session[:gear_bag].nil?
      @reservation = Reservation.new(lodging_id: reservation_params[:lodging_id], user_id: current_user.id, start_date: reservation_params[:start_date], end_date: reservation_params[:end_date], rent_eq: false, lift_pass_id: session[:lift_pass]["id"], duration: calculate_duration)
      @reservation.attributes = {:total_cost => @reservation.calculate_cost}

      if @reservation.valid?
        @reservation.save
        session[:lift_pass] = nil
        session[:gear_bag] = nil
        flash[:notice] = "Your reservation was created with a lift pass & lodging."
        redirect_to reservation_path(@reservation.id)
      else
        flash[:error] = @reservation.errors.messages
        redirect_to new_reservation_path
      end

    
    #lift_pass, gearbag, & lodging
    elsif session[:lift_pass] != nil && session[:gear_bag] != nil && params[:reservation][:start_date] != "" && params[:reservation][:end_date] != ""
      @reservation = Reservation.new(lodging_id: reservation_params[:lodging_id], user_id: current_user.id, start_date: reservation_params[:start_date], end_date: reservation_params[:end_date], rent_eq: true, lift_pass_id: session[:lift_pass]["id"], gear_bag_id: session[:gear_bag]["id"], duration: calculate_duration)
      @reservation.attributes = {:total_cost => @reservation.calculate_cost}
        
      if @reservation.valid?
        @reservation.save
        session[:lift_pass] = nil
        session[:gear_bag] = nil
        flash[:notice] = "Your reservation was created with a lift pass, rental gear, and lodging."
        redirect_to reservation_path(@reservation.id)
      else
        flash[:error] = @reservation.errors.messages
        redirect_to new_reservation_path
      end

    #lift_pass, gearbag
    elsif session[:lift_pass] != nil && session[:gear_bag] != nil && params[:reservation][:start_date] == "" && params[:reservation][:end_date] == ""
      @reservation = Reservation.new(user_id: current_user.id, rent_eq: true, lift_pass_id: session[:lift_pass]["id"], gear_bag_id: session[:gear_bag]["id"])
      @reservation.attributes = {:total_cost => @reservation.calculate_cost}
      
      if @reservation.valid?
        @reservation.save
        session[:lift_pass] = nil
        session[:gear_bag] = nil
        flash[:notice] = "Your reservation was created with a lift pass & rental gear."
        redirect_to reservation_path(@reservation.id)
      else
        flash[:error] = @reservation.errors.messages
        redirect_to new_reservation_path
      end
    end
  end

  def show
  end

  # def edit
  # end

  # def update
  #   @reservation.update(reservation_params)
  #   redirect_to reservation_path(@reservation)
  # end

  def destroy
    @reservation.destroy
  end

  def res_liftpass
    byebug
    render :new_lift_pass_path
  end
  
  def res_gearbag
  end

  def res_lodging
  
  end

  def rent_lodging
    @reservation = Reservation.new
  end

  private

  def get_reservation
    @reservation = Reservation.all.find_by(id: params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user_id, :rent_eq, :lodging_id, :lift_pass_id, :gear_bag_id)
  end

  def calculate_duration
    (reservation_params[:end_date].to_date - reservation_params[:start_date].to_date).to_i
  end

end
