class TrabisController < ApplicationController
  def index
    @trabis = Trabi.all
  end

  def show
    @trabis = Trabi.find(params[:id])
  end

  private

  def trabi_params
  end
end
