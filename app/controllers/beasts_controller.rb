class BeastsController < ApplicationController
  before_action :authenticate_sucker!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_current_beast, only: [:show, :edit, :update, :destroy]
  def index
    @beasts = Beast.geocoded
    if params[:query].present?
      @beasts = Beast.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @beasts = Beast.all
    end

    @markers = @beasts.map do |beast|
      {
        lat: beast.latitude,
        lng: beast.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { beast: beast }),
        image_url: helpers.asset_url('pokeball.png')
      }
    end

    policy_scope @beasts
    authorize @beasts
  end

  def show
    @beast_geo = @current_beast.geocode
    unless @beast_geo.nil?
      @markers = [{
        lat: @beast_geo[0],
        lng: @beast_geo[1],
        image_url: helpers.asset_url('pokeball.png')
      }]
    end

    @booking = Booking.new(beast_id: @current_beast.id)
    @average_rating = 0
    @count = 0
    @current_beast.reviews.each do |review|
      if review.sucker_rating
        @count += 1
        @average_rating += review.sucker_rating
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
    redirect_to @beast, notice: 'Beast was successfully created.'
    authorize @beast
  end

  def edit
    authorize @current_beast
  end

  def update
    if @current_beast.update(beast_params)
      redirect_to @current_beast, notice: 'Beast was successfully updated.'
      authorize @current_beast
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
    params.require(:beast).permit(:sucker_id, :type_id, :name, :region, :description, :price)
  end
end
