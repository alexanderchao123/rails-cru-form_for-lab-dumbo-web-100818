class SongsController < ApplicationController
  def index
    @songs = Song.all()
  end

  def new
    @song = Song.new()
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      # display error message
    end
  end

  def show
    @song = Song.find_by(id: params[:id])
    @genre = @song.genre
    @artist = @song.artist
  end

  def edit
    @song = Song.find_by(id: params[:id])
  end

  def update
    @song = Song.find_by(id: params[:id])
    if @song.update(song_params)
      redirect_to song_path
    else
      # display error message
    end
  end

  private

  def song_params
    params.require(:song).permit(:name, :artist_id, :genre_id)
  end
end
