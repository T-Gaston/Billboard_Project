class BillboardsController < ApplicationController

  before_action :set_billboard, only: [:show, :update, :edit, :destroy]

  def index
    @billboards = Billboard.all
  end

  def show
    @songs = @billboard.songs.all
    # @songs = Song.all - @board_songs
    # binding.pry
  end

  def new
    @billboard = Billboard.new
    render partial: "form"
  end

  def create
    @billboard = Billboard.new(billboard_params)

    if @billboard.save
      redirect_to billboards_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @billboard.update(billboard_params)
      redirect_to billboard_path(@billboard)
    else
      render :edit
    end
  end

  def destroy
    @billboard.destroy
    redirect_to billboards_path
  end



  def add_song
    @billboard = Billboard.find(params[:id])
    @billboard.songs << Song.find(params[:song_id])
    redirect_to billboard_path(@billboard)
  end

  def new_song
    @billboard = Billboard.find(params[:id])
    @songs = Song.all.where(billboard_id: nil)
  end

  def remove_song
    @billboard = Billboard.find(params{:id})
    Song.find(params[:song_id]).update(billboard_id: nil)
    redirect_to billboard_path(@billboard)
  end


  private

  def billboard_params
    params.require(:billboard).permit(:name)
  end

  def set_billboard
    @billboard = Billboard.find(params[:id])
  end

end
