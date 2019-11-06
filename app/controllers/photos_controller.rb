class PhotosController < ApplicationController
  before_action :authenticate_sucker!
end
