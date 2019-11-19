class TrabisController < ApplicationController
  def index
    @trabis = Trabi.all
  end

  def show
    @trabi = Trabi.find(params[:id])
  end

  def new
    @trabi = Trabi.new
  end

  def create
    @trabi = Trabi.new(trabi_params)
    @trabi.save
    redirect_to trabis_path(@trabi)
  end

  # get trabis/id/edit
  # def edit
  #   @trabi =
  # end

  # patch trabis/id
  def update

  end

  private

  def trabi_params
    params.require(:trabi).permit(:title, :description, :year, :color, :user_id)
  end
end
