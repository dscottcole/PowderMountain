class ReservationsController < ApplicationController
  before_action :get_reservation, only: [:show, :edit, :update, :destroy]
  
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.create(reservation_params)
    redirect_to reservation_path(@reservation)
  end

  def show
  end

  def edit
  end

  def update
    @reservation.update(reservation_params)
    redirect_to reservation_path(@reservation)
  end

  def destroy
    @reservation.destroy
  end

  private

  def get_reservation
    @reservation = Reservation.all.find_by(id: params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user_id, :rent_eq, :lodging_id, :lift_pass_id, :gear_bag_id)
  end
end
