class TrabisController < ApplicationController
  before_action :set_trabi, only: [:show, :edit, :update, :destroy]

  def index
    @trabis = Trabi.all
    @search = params["search"]
    if @search.present?
      @location = @search["location"]
      @trabis = Trabi.where(Trabi.where("location ILIKE ?", "%#{@location}%"))
    end
  end

  def show
  end

  def new
    @trabi = Trabi.new
  end

  def create
    @trabi = Trabi.new(trabi_params)
    @trabi.save
    redirect_to trabis_path(@trabi)
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

  def set_trabi
    @trabi = Trabi.find(params[:id])
  end

  def trabi_params
    params.require(:trabi).permit(:title, :description, :year, :color, :user_id)
  end
end
