class ReservationsController < ApplicationController
  before_action :get_reservation, only: [:show, :edit, :update, :destroy, :lodging_rental]
  before_action :log_check, only: [:index, :new, :create, :show, :edit, :update, :destoy, :lodging_rental]
  
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

    elsif params[:reservation][:start_date] == "" && params[:reservation][:end_date] != ""
      flash[:error] = [Lodging_date_range_Error: "Please revise your lodging dates."]
      redirect_to new_reservation_path

    elsif params[:reservation][:start_date] != "" && params[:reservation][:end_date] == ""
      flash[:error] = [Lodging_date_range_Error: "Please revise your lodging dates."]
      redirect_to new_reservation_path

    ## Just lift_pass  
    elsif session[:lift_pass] != nil && session[:gear_bag].nil? && params[:reservation][:start_date] == "" && params[:reservation][:end_date] == ""
      @reservation = Reservation.new(start_date: session[:lift_pass]["start_date"], end_date: session[:lift_pass]["end_date"], user_id: current_user.id, rent_eq: false, lift_pass_id: session[:lift_pass]["id"])
      @reservation.attributes = {:total_cost => @reservation.calculate_cost}

      if @reservation.valid?
        @reservation.save
        session[:lift_pass] = nil
        flash[:notice] = "Your reservation was created with just a lift pass."
        clear_pending_lp
        clear_pending_gb
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
        clear_pending_lp
        clear_pending_gb
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
        clear_pending_lp
        clear_pending_gb
        redirect_to reservation_path(@reservation.id)
      else
        flash[:error] = @reservation.errors.messages
        redirect_to new_reservation_path
      end

    #lift_pass, gearbag
    elsif session[:lift_pass] != nil && session[:gear_bag] != nil && params[:reservation][:start_date] == "" && params[:reservation][:end_date] == ""
      @reservation = Reservation.new(start_date: session[:lift_pass]["start_date"], end_date: session[:lift_pass]["end_date"],user_id: current_user.id, rent_eq: true, lift_pass_id: session[:lift_pass]["id"], gear_bag_id: session[:gear_bag]["id"])
      @reservation.attributes = {:total_cost => @reservation.calculate_cost}
      
      if @reservation.valid?
        @reservation.save
        session[:lift_pass] = nil
        session[:gear_bag] = nil
        flash[:notice] = "Your reservation was created with a lift pass & rental gear."
        clear_pending_lp
        clear_pending_gb
        redirect_to reservation_path(@reservation.id)
      else
        flash[:error] = @reservation.errors.messages
        redirect_to new_reservation_path
      end
    end
  end

  def show
    if current_user.id != @reservation.user.id && current_user.admin? == false
      flash[:error] = "You can only view your own reservations."
      redirect_to home_path
    end
  end

  def edit
    if @reservation.start_date >= Date.today

    else
      flash[:error] = "Your lift pass has lapsed and cannot be edited."
      redirect_to lodging_rental_path(@reservation.id)
    end
  end

  def update

    @reservation.attributes = {:start_date => reservation_params[:start_date], :end_date => reservation_params[:end_date], :lodging_id => reservation_params[:lodging_id], :duration => calculate_duration}
  
    if @reservation.valid?
      @reservation.save
      flash[:notice] = "Successfully updated lodging reservation!"
      @reservation.attributes = {:total_cost => @reservation.calculate_cost}
      @reservation.save
      redirect_to lodging_rental_path(@reservation.id)
    else
      flash[:error] = @reservation.errors.messages
      redirect_to lodging_rental_path(@reservation.id)
    end

  end

  def destroy
    

    if @reservation.start_date >= Date.today
      @reservation.lift_pass.destroy
  
      if !@reservation.gear_bag.nil?
        @reservation.gear_bag.destroy
      end

      @reservation.destroy

      flash[:notice] = "Your reservation has been obliterated."
      redirect_to home_path

    else
      flash[:error] = "Your lift pass has lapsed and cannot be edited."
      redirect_to lodging_rental_path(@reservation.id)
    end

  end

  def lodging_rental
    if current_user.id != @reservation.user.id && current_user.admin? == false
      flash[:error] = "You can only view your own lodging rentals."
      redirect_to home_path
    end
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
