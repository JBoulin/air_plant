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

  # def destroy
  #   @plant = Plant.find(params[:plant_id])
  #   @booking = @plant.bookings.find(params[:id])
  #   @booking.destroy

  #   respond_to do |format|
  #     format.turbo_stream { render turbo_stream: turbo_stream.remove(@booking) }
  #     format.html { redirect_to bookings_path, notice: 'Réservation annulée avec succès.' }
  #   end
  # end
  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end

end
