class TrabisController < ApplicationController
  def index
    @trabis = Trabi.all
  end

  def show
    @trabi = Trabi.find(params[:id])
    @pictures = @trabi.pictures.all
    # @picture = Picture.find(params[:id])
  end

  def new
    @trabi = Trabi.new
    @picture = @trabi.pictures.build
  end

  def create
    @trabi = Trabi.new(trabi_params)

    params["picters"]
    # raise
    # @trabi.save
    # redirect_to trabi_path(@trabi)
    respond_to do |format|
     if @trabi.save
       params[:pictures]['url'].each do |a|
          # @picture = @trabi.pictures.create!(url: a, trabi_id: @trabi.id)
          @picture = Picture.new(url: a)
          @picture.trabi_id = @trabi.id
          @picture.save
          # Cloudinary::Uploader.upload(trabi_params)
       end
       format.html { redirect_to @trabi, notice: 'Trabi was successfully created.' }
     else
       format.html { render action: 'new' }
     end
    end
  end

  private

  def trabi_params
    params.require(:trabi).permit(:color, :year, :description, :location, :user_id, pictures_attributes: [:id, :trabi_id, :url])
  end
end
