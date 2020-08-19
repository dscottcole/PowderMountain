class GearBagsController < ApplicationController
  before_action :get_gear_bag, only: [:show, :edit, :update, :destroy]
  
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
    byebug
    @gear_bag = GearBag.create(gear_bag_params)
    redirect_to gear_bag_path(@gear_bag)
  end

  def show
  end

  def edit
  end

  def update
    @gear_bag.update(gear_bag_params)
    redirect_to gear_bag_path(@gear_bag)
  end

  def destroy
    @gear_bag.destroy
    redirect_to gear_bags_path
  end

  private

  def get_gear_bag
    @gear_bag = GearBag.all.find_by(id: params[:id])
  end

  def gear_bag_params
    params.require(:gear_bag).permit(:bike_id, :helmet_id, :pads_id, :gloves_id, :goggles_id)
  end
end
