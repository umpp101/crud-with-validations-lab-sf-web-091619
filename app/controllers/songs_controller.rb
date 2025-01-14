class SongsController < ApplicationController
    before_action :find_song, only: [:show, :update, :edit, :destroy]

    def index 
        @songs = Song.all
    end

    def new 
        @song = Song.new
    end

    def create 
        @song = Song.new(song_params)
        if @song.valid?
            @song.save
            redirect_to @song
        else
        render 'new'
        end
    end

    def update 
        @song.update(song_params)
        if @song.valid?
            redirect_to @song
        else
        render 'edit'
        end
    end

    def edit
    end

    def show
    end

    def destroy
        @song.destroy
        redirect_to @song
    end

    private

	def song_params
		params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
	end

	def find_song
		@song = Song.find(params[:id])
	end
end

