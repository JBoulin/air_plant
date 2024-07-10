class PlantsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
    @booking = Booking.new
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = current_user.plants.build(plant_params)
    if @plant.save
      redirect_to @plant, notice: 'Plant was successfully created.'
    else
      render :new
    end
  end

  def book
    @plant = Plant.find(params[:id])
    @reservation = @plant.reservations.build(user: current_user)
    if @reservation.save
      ReservationMailer.with(user: current_user, plant: @plant).booking_email.deliver_later
      redirect_to @plant, notice: 'Plant booked successfully.'
    else
      redirect_to @plant, alert: 'Could not book the plant.'
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :description, :price, :photo)
  end
end
