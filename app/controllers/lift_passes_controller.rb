class LiftPassesController < ApplicationController
  before_action :get_lift_pass, only: [:show, :edit, :update, :destroy]
  
  def index
    @lift_passes = LiftPass.all
  end

  def new
    @lift_pass = LiftPass.new
  end

  def create
    @lift_pass = LiftPass.create(lift_pass_params)
    redirect_to lift_pass_path(@lift_pass)
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
    params.require(:lift_pass).permit(:pass_type, :duration, :price, :user_id)
  end
end
