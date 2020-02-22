class BillboardsController < ApplicationController

  before_action :set_billboard, only: [:show, :update, :edit, :destroy]

  def index
    @billboards = Billboard.all
  end

  def show
    @billboard = Billboard.find(params[:id])
    @songs = @billboard.songs
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
  end



  def add_song
  end

  def new_song
  end

  def remove_song
  end


  private

  def billboard_params
    params.require(:billboard).permit(:name)
  end

  def set_billboard
    @billboard = Billboard.find(params[:id])
  end

end
