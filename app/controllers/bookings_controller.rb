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
      redirect_to root # TODO: update this to user profile once working
    else
      render :new # TODO: update this to user profile once working
    end
  end

  def booking_params
    params.require(:booking).permit(:rating, :content)
  end

end

