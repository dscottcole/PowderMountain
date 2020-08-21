class LodgingsController < ApplicationController
  before_action :get_lodging, only: [:show, :edit, :update, :destroy]
  before_action :log_check, :admin_check, only: [:new, :create, :edit, :update, :destroy]
  before_action :log_check, only: [:index, :show ]
  
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
    @lodging.attributes = {:lodging_name => lodging_params[:lodging_name], :price => lodging_params[:price], :description => lodging_params[:description]}

    if @lodging.valid?
      @lodging.save
      flash[:notice] = "Lodging edit was successful."
      redirect_to lodging_path(@lodging)
    else
      flash[:error] = @lodging.errors.messages
      redirect_to edit_lodging_path(@lodging)
    end
  end

  def destroy
    @lodging.destroy
    flash[:notice] = "Lodging has been destroyed."
    redirect_to home_path
  end

  def available_lodging
    @lodgings = Lodging.all
    @camps = Lodging.av_camp
    @cabins = Lodging.av_cabin
  end


  private

  def get_lodging
    @lodging = Lodging.all.find_by(id: params[:id])
  end

  def lodging_params
    params.require(:lodging).permit(:lodging_name, :price, :description, :rented)
  end
end
