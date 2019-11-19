class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    @current_bookings = []
    @archived_bookings = []

    @user.bookings.each do |booking|
      if booking.start_date == booking.end_date
        @current_bookings << booking
      elsif booking.rating_review.nil? && (DateTime.now - booking.end_date) < 86_400_000
        @current_bookings << booking
      else
        @archived_bookings << booking
      end
    end

  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :phone_number, :street_address, :city_address, :zip_address, :country_address)
  end


    # @trabis = Trabi.where(user_id: @user.id)
    # @bookings = Booking.where(user_id: @user.id)

end
