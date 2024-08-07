class PlantsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_plant, only: [:show, :edit, :update]

  def index
    if params[:query].present?
      @plants = Plant.search_by_name(params[:query])
    else
      @plants = Plant.all
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = current_user.plants.build(plant_params)
    if @plant.save
      redirect_to mes_plantes_plants_path, notice: 'Plante ajoutée à la location !'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @plant.update(plant_params)
      redirect_to mes_plantes_plants_path, notice: 'Votre plante a été modifiée'
    else
      render :edit
    end
  end

  def destroy
    @plant = Plant.find(params[:format])
    if @plant.destroy!
      redirect_to mes_plantes_plants_path, notice: 'Votre plante a été supprimée'
    end
  end

  def book
    @reservation = @plant.reservations.build(user: current_user)
    if @reservation.save
      ReservationMailer.with(user: current_user, plant: @plant).booking_email.deliver_later
      redirect_to @plant, notice: 'Plant booked successfully.'
    else
      redirect_to @plant, alert: 'Could not book the plant.'
    end
  end

  def mes_plantes
    @plants = Plant.where(user: current_user)
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:name, :description, :price, :photo, :query)
  end
end
