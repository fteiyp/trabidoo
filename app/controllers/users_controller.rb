class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    @user = User.find(params[:id])

    @current_bookings = []
    @archived_bookings = []
    @trabis_info = getInfoAboutTrabi

    @user.bookings.order(start_date: :desc).each do |booking|
      (DateTime.now - booking.end_date.to_datetime).to_s
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

  private

  def getInfoAboutTrabi
    @user = User.find(params[:id])

    result_info = {}
    @user.trabis.each do |trabi|

      now = DateTime.now
      booked = false
      upcoming_booking = now
      last_booking = now

      trabi.bookings.order(start_date: :desc).each do |booking|
        if booking.start_date <= now && now <= booking.end_date
          booked = true
        end
        if booking.start_date > upcoming_booking
          upcoming_booking = booking.start_date
        end
        if last_booking == now && booking.end_date < last_booking
          last_booking = booking.end_date
        end
      end

      result_info[trabi.id] = {
        state: booked ? "Booked" : "Free",
        upcoming: upcoming_booking == now ? "No booking" : upcoming_booking.strftime("%F"),
        last: last_booking == now ? "Never booked" : last_booking.strftime("%F")
      }

    end
    return result_info
  end

end
