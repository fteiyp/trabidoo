class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @user = User.find(params[:id])

    @current_bookings = []
    @archived_bookings = []

    @user.bookings.each do |booking|
      p (DateTime.now - booking.end_date.to_datetime).to_s
      if booking.start_date == booking.end_date
        @current_bookings << booking
      elsif booking.rating_review.nil? && (DateTime.now - booking.end_date.to_datetime) < 86_400_000
        @current_bookings << booking
      else
        @archived_bookings << booking
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if params[:file].nil?
      @user.update(first_name: params[:first_name], last_name: params[:last_name],
                   email: params[:email], phone_number: params[:phone_number],
                   street_address: params[:street_address], city_address: params[:city_address],
                   zip_address: params[:zip_address], country_address: params[:country_address])
      redirect_to user_path(@user)
    else
      @user.update(first_name: params[:first_name], last_name: params[:last_name],
                   email: params[:email], phone_number: params[:phone_number],
                   street_address: params[:street_address], city_address: params[:city_address],
                   zip_address: params[:zip_address], country_address: params[:country_address],
                   photo: params[:file]["0"])
    end
  end
end
