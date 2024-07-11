class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user: current_user)
  end

  def my_bookings
    @bookings = Booking.where(plant: current_user.plants)
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @booking = Booking.new(booking_params)
    @booking.plant = @plant
    @booking.user = current_user

    if @booking.save!
      redirect_to bookings_path, notice: "Votre plante est réservée !"
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end

end
