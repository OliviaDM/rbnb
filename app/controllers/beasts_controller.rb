class BeastsController < ApplicationController
  before_action :set_current_beast, only: [:show, :edit, :update, :destroy]
  def index
    @beasts = Beast.all
  end

  def show
  end

  def new
    @beast = Beast.new(beast_params)
  end

  def create
    @beast = Beast.new(beast_params)
    @beast.save
    redirect_to @beast, notice: 'Beast was successfully created.'
  end

  def edit
  end

  def update
    if @current_beast.update(beast_params)
      redirect_to @beast, notice: 'Beast was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @current_beast.destroy
    redirect_to beasts_url, notice: 'Beast was successfully destroyed.'
  end

  private

  def set_current_beast
    @current_beast = Beast.find(params[:id])
  end

  def beast_params
    params.require(:beast).permit(:sucker, :type, :name, :region, :description)
  end
end
