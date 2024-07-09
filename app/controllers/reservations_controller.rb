class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations
  end

  def my_reservations
    @reservations = Reservation.where(plant: current_user.plants)
  end
end
