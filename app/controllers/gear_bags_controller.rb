class GearBagsController < ApplicationController
  before_action :get_gear_bag, only: [:show, :edit, :update, :destroy]
  before_action :log_check, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  
  def index
    @gear_bags = GearBag.all
  end

  def new
    @gear_bag = GearBag.new
    @bikes = Equipment.bikes
    @helmets = Equipment.helmets
    @pads = Equipment.pads
    @gloves = Equipment.gloves
    @goggles = Equipment.goggles
  end

  def create
  
     if params[:gear_bag][:start_date].empty? || params[:gear_bag][:end_date].empty?
      flash[:error] = [Gear_Date_Range_Error: "Please ensure that none of the gear rental dates are empty."]
      redirect_to new_reservation_path
    else
      @gear_bag = GearBag.new(bike_id: gear_bag_params[:bike_id], helmet_id: gear_bag_params[:helmet_id], pads_id: gear_bag_params[:pads_id], gloves_id: gear_bag_params[:gloves_id], goggles_id: gear_bag_params[:goggles_id], start_date: gear_bag_params[:start_date], end_date: gear_bag_params[:end_date], duration: calculate_duration, user_id: current_user.id)
      if @gear_bag.valid?
        @gear_bag.save
        flash[:notice] = "Your gear has been reserved. Continue to reserve lodging if you need it."
        session[:gear_bag] = @gear_bag      
        redirect_to new_reservation_path
      else
        flash[:error] = @gear_bag.errors.messages
        redirect_to new_reservation_path
      end
    end
  end

  def show
  end

  def edit
    if @gear_bag.start_date >= Date.today

    else
      flash[:error] = "Your gear rental has lapsed and cannot be edited."
      redirect_to gear_bag_path(@lift_pass.id)
    end
  end

  def update
    
    @gear_bag.attributes = {:bike_id => gear_bag_params[:bike_id], :helmet_id => gear_bag_params[:helmet_id], :pads_id => gear_bag_params[:pads_id], :gloves_id => gear_bag_params[:gloves_id], :goggles_id => gear_bag_params[:goggles_id], :start_date => gear_bag_params[:start_date], :end_date => gear_bag_params[:end_date], :duration => calculate_duration, :user_id => current_user.id}
  
    if @gear_bag.valid?
      @gear_bag.save
      flash[:notice] = "Successfully updated gear bag!"
      @gear_bag.reservation.attributes = {:total_cost => @gear_bag.reservation.calculate_cost}
      @gear_bag.reservation.save
      redirect_to gear_bag_path(@gear_bag.id)
    else
      flash[:error] = @gear_bag.errors.messages
      redirect_to edit_gear_bag_path(@gear_bag.id)
    end

  end

  def destroy
    session[:gear_bag] = nil
    @gear_bag.destroy
    redirect_to home_path
  end

  private

  def get_gear_bag
    @gear_bag = GearBag.all.find_by(id: params[:id])
  end

  def gear_bag_params
    params.require(:gear_bag).permit(:bike_id, :helmet_id, :pads_id, :gloves_id, :goggles_id, :start_date, :end_date, :user_id)
  end

  def calculate_duration
    (gear_bag_params[:end_date].to_date - gear_bag_params[:start_date].to_date).to_i
  end

end
