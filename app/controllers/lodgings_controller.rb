class LodgingsController < ApplicationController
  before_action :get_lodging, only: [:show, :edit, :update, :destroy]
  
  def index
    @lodgings = Lodging.all
  end

  def new
    @lodging = Lodging.new
  end

  def create
    @lodging = Lodging.create(lodging_params)
    redirect_to lodging_path(@lodging)
  end

  def show
  end

  def edit
  end

  def update
    @lodging.update(lodging_params)
    redirect_to lodging_path(@lodging)
  end

  def destroy
    @lodging.destroy
  end

  private

  def get_lodging
    @lodging = Lodging.all.find_by(id: params[:id])
  end

  def lodging_params
    params.require(:lodging).permit(:lodge_type, :number, :price)
  end
end
