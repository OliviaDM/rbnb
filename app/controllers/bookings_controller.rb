class BookingsController < ApplicationController
  before_action :authenticate_sucker!, only: [:create, :edit, :update, :destroy]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def show
    @beast = @booking.beast
    @review = @booking.review
    authorize @booking
  end

  # def new
  #   @booking = Booking.new
  # end

  def create
    @booking = Booking.new(booking_params)
    @booking.beast_id = params[:id]

    @booking.sucker_id = current_sucker.id
    @availabilities = Availability.where(beast_id: @booking.beast_id)
    found = false
    @availabilities.each do |availability|
      if @booking.start_date > availability.start_date && @booking.end_date < availability.end_date
        new_availability = Availability.new(start_date: @booking.end_date, end_date: availability.end_date)
        availability.update(end_date: @booking.start_date)
        new_availability.beast_id = @booking.beast_id
        new_availability.save
        found = true
      end
    end
    if found
      @booking.save
      @review = Review.new()
      @review.booking_id = @booking.id
      @review.save
      redirect_to sucker_path(current_sucker.id)
    else
      redirect_to beast_path(@booking.beast_id)
    end
    authorize @booking
  end

  def edit
    authorize @booking
  end

  def update
    @booking.update(booking_params)
    authorize @booking
  end

  def destroy
    @booking.destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:sucker_id, :beast_id, :start_date, :end_date)
  end
end
