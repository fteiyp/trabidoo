class TrabisController < ApplicationController
  def index
    @trabis = Trabi.all
  end

  def show
    @trabis = Trabi.find(params[:id])
  end

  def new
    @trabi = Trabi.new
  end

  def create
    @trabi = Trabi.new(trabi_params)
    @trabi.save
    redirect_to trabi_path(@trabi)
  end

  private

  def trabi_params
    params.require(:trabi).permit(:title, :description)
  end
end
