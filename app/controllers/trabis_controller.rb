class TrabisController < ApplicationController
  before_action :set_trabi, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @trabis = Trabi.search_by_address_title_year_and_color(params[:query])
      @available_trabbis = []

      # filter through @trabis
      @trabis.each do |trabi|
        trabi.bookings.each do |booking|
          if booking.start_date != params[:start]
            @available_trabbis << trabi
          end
        end

        @available_trabbis = @available_trabbis.uniq

      end

    else
      @trabis = Trabi.all
      # TODO: Show only 10 results
    end
<<<<<<< HEAD
    # @search = params["search"]
    # if @search.present?
    #   @location = @search["location"]
    #   @trabis = Trabi.where(Trabi.where("location ILIKE ?", "%#{@location}%"))
    # end
=======
    @trabis_geo = @trabis.geocoded
    @markers = @trabis_geo.map do |trabi|
      {
        lat: trabi.latitude,
        lng: trabi.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { trabi: trabi }),
        image_url: helpers.asset_url('pink.png')
      }
    end
>>>>>>> f4af89d16fd4ac217c06bf2af55c885a37ff2709
  end

  def show
    @booking = Booking.new
    @trabi = Trabi.find(params[:id])
    @user = User.find(@trabi.user_id)
  end

  def new
    @trabi = Trabi.new
  end

  def create
    @trabi = Trabi.new(trabi_params)
    if @trabi.save
      # CALL THE create_pictures METHOD AFTER @product.save
      # create_pictures
      photos = params.dig(:trabi, :pictures) || []
      photos.each do |photo|
        pic = Picture.new(url: photo)
        pic.trabi_id = @trabi.id
        pic.save!
      end
      redirect_to trabi_path(@trabi)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @trabi.update(trabi_params)
    redirect_to trabis_path(@trabi)
  end

  def destroy
    @trabi.is_active = false
    @trabi.save!
    redirect_to trabis_path(@trabi)
  end

  private

  def create_pictures
    # photos = params.dig(:trabi, :pictures) || []
    # photos.each do |photo|
    #   pic = Picture.new(url: photo)
    #   pic.trabi_id =
    # end
  end

  def set_trabi
    @trabi = Trabi.find(params[:id])
  end

  def trabi_params
    params.require(:trabi).permit(:title, :description, :year, :color, :user_id)
  end
end
