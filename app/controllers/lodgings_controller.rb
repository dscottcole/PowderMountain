class LodgingsController < ApplicationController
  before_action :get_lodging, only: [:show, :edit, :update, :destroy]
  before_action :log_check, :admin_check, only: [:new, :edit, :update, :destroy]
  
  def index
    @lodgings = Lodging.all
    @camps = Lodging.av_camp
    @cabins = Lodging.av_cabin
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
    redirect_to lodgings_path
  end

  def rent_lodging
    @lodging = Lodging.new
  end


  private

  def get_lodging
    @lodging = Lodging.all.find_by(id: params[:id])
  end

  def lodging_params
    params.require(:lodging).permit(:lodging_name, :price, :description, :rented)
  end
end
