class PhotosController < ApplicationController

  def index
    @photos = Photo.includes(:user).page(params[:page]).per(18).order("created_at DESC")
  end
  
  def new
    @photo = Photo.new
  end

  def create
    Photo.create(photo_params)
    redirect_to root_path
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    if user_signed_in? && @photo.user_id == current_user.id
      @photo.destroy
      redirect_to dComplete_photos_path
    else
      render acction: :show
    end
  end

  def dComplete
  end

  private
  def photo_params
    params.require(:photo).permit(:image, :title, :explanation).merge(user_id: current_user.id)
  end


end
