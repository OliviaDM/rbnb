class SuckersController < ApplicationController
  before_action :authenticate_sucker!, only: [:edit, :update]
  before_action :set_current_sucker, only: [:show, :edit, :update]
  def new
    @sucker = Sucker.new()
  end

  def create
    @sucker = Sucker.new(sucker_params)
    @sucker.save
  end

  def edit
  end

  def update
    @test_sucker.update(sucker_params)
  end

  def show
    @average_rating = 0
    @count = 0
    @test_sucker.reviews.each do |review|
      if review.sucker_rating
        @count += 1
        @average_rating += review.sucker_rating
      end
    end
    authorize @test_sucker
  end

  private

  def set_current_sucker
    @test_sucker = Sucker.find(params[:id])
  end

  def sucker_params
    params.require(:sucker).permit(:name, :user_name, :passowrd, :email, :phone)
  end
end
