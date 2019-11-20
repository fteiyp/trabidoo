class UsersController < ApplicationController
  #skip_before_action :verify_authenticity_token

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
    puts("PARAMETERS")
    p params
    @user = User.find(params[:id])

    puts("AAAAAparams['user']: #{params['user']['first_name']}")

    if params[:file].nil?
      @user.update(user_params)
      redirect_to user_path(@user)
    else
      @user.update(user_params)
      @user.photo = params[:file]["0"]
      @user.save
    end


  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number,
                                 :street_address, :city_address, :zip_address, :country_address)
  end
end
