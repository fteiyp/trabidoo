class BookingsController < ApplicationController
  def new
    # @trabi = Trabi.find(params[:trabi_id])
    @booking = Booking.new
    @user = User.find(params[:user_id])
    @trabi = Trabi.find(params[:trabi_id])
  end

  def create
    @user = User.find(params[:user_id])
    @trabi = Trabi.find(params[:trabi_id])
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.trabi = @trabi

    if @booking.save
      redirect_to(user_path(@user) + "#bookings") # TODO: update this to user profile once working
    else
      render :new
      # TODO: make an alert that says 'Dates not entered'
      #       or says "Dates invalid: already booked"
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to(user_path(@booking.user_id) + "#bookings")
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :rating_review, :content_review)
  end
end
