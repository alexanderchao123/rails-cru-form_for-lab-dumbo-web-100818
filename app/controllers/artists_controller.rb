class ArtistsController < ApplicationController
  def new
    @artist = Artist.new()
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      # display error message
    end
  end

  def show
    @artist = Artist.find_by(id: params[:id])
  end

  def edit
    @artist = Artist.find_by(id: params[:id])
  end

  def update
    @artist = Artist.find_by(id: params[:id])
    if @artist.update(artist_params)
      redirect_to artist_path
    else
      # display error message
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :bio)
  end
end
