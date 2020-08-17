class EquipmentsController < ApplicationController
  
  before_action :get_equipment, only: [:show, :edit, :update, :destroy]
  
  def index
    @equipments = Equipment.all
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.create(equipment_params)
    redirect_to equipment_path(@equipment)
  end

  def show
  end

  def edit
  end

  def update
    @equipment.update(equipment_params)
    redirect_to equipment_path(@equipment)
  end

  def destroy
    @equipment.destroy
  end

  private

  def get_equipment
    @equipment = Equipment.all.find_by(id: params[:id])
  end

  def equipment_params
    params.require(:equipment).permit(:sport, :equipment_type, :eq_name, :size, :purchase_price, :rental_price, :stock)
  end

end
