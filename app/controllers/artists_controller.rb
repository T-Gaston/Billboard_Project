class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :destroy]


  def index
    @artists = Artist.all
  end

  def show
  end

  def new
    @artist = Artist.new
  end

  def edit
  end

  def create
  end

  def destroy
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end


end
