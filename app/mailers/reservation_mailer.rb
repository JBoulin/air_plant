class ReservationMailer < ApplicationMailer
  def booking_email
    @user = params[:user]
    @plant = params[:plant]
    mail(to: @plant.user.email, subject: 'Your plant has been booked')
  end
end
