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
    @diff_in_days = @booking.end_date - @booking.start_date
    @total_price = ((@diff_in_days * @plant.price) + 7)
    @booking.total_price = @total_price

    if @booking.save!
      redirect_to bookings_path, notice: "Votre plante est réservée !"
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])

    if @booking.destroy
      redirect_to delete_booking_path, notice: "La réservation a été annulée avec succès."
    else
      redirect_to bookings_path, alert: "Erreur lors de l'annulation de la réservation."
    end
  end
  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end

end
