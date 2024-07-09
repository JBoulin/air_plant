class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    @plant = Plant.find(params[:plant_id])
    @photo = @plant.photos.build(photo_params)
    if @photo.save
      redirect_to @plant, notice: 'Photo added successfully.'
    else
      redirect_to @plant, alert: 'Could not add the photo.'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to @photo.plant, notice: 'Photo removed successfully.'
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end
end
