class SuckersController < ApplicationController
  def new
    @sucker = Sucker.new()
  end

  def create
    @sucker = Sucker.new(sucker_params)
    @sucker.save
  end

  def edit
    @sucker = Sucker.find(params[:id])
  end

  def update
    @sucker = Sucker.find(params[:id])
    @rsucker.update(sucker_params)
  end

  def show
    @sucker = Sucker.find(params[:id])
  end

  private

  def sucker_params
    params.require(:sucker).permit(:name, :user_name, :passowrd, :email, :phone)
  end
end
