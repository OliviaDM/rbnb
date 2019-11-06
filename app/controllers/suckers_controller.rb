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
    @current_sucker.update(sucker_params)
  end

  def show
  end

  private

  def set_current_sucker
    @current_sucker = Sucker.find(params[:id])
  end

  def sucker_params
    params.require(:sucker).permit(:name, :user_name, :passowrd, :email, :phone)
  end
end
