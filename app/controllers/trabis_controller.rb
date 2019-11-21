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
    # @search = params["search"]
    # if @search.present?
    #   @location = @search["location"]
    #   @trabis = Trabi.where(Trabi.where("location ILIKE ?", "%#{@location}%"))
    # end
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
        p photo
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
    @trabi.destroy
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
