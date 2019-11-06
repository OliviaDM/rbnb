class BeastsController < ApplicationController
  before_action :authenticate_sucker!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_beast, only: [:show, :edit, :update, :destroy]
  def index
    @beasts = Beast.all
    policy_scope @beasts
    authorize @beasts
  end

  def show
    @booking = Booking.new(beast_id: @current_beast.id)
    @average_rating = 0
    @count = 0
    @current_beast.reviews.each do |review|
      if review.beast_rating
        @count += 1
        @average_rating += review.beast_rating
      end
    end
    authorize @current_beast
  end

  def new
    @beast = Beast.new()
    authorize @beast
  end

  def create
    @beast = Beast.new(beast_params)
    @beast.sucker_id = current_sucker.id
    @beast.save
    raise
    redirect_to @beast, notice: 'Beast was successfully created.'
    authorize @beast
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
    params.require(:beast).permit(:sucker_id, :type_id, :name, :region, :description)
  end
end
