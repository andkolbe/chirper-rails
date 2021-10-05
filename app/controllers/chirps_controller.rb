class ChirpsController < ApplicationController
  def index
    @chirps = Chirp.all
  end

  def show
    @chirp = Chirp.find(params[:id])
  end

  # display the page to write a new chirp
  def new
    @chirp = Chirp.new
  end

  # POST request to write a new chirp
  def create
    @chirp = Chirp.new(chirp_params)

    if @chirp.save
      redirect_to @chirp
    else
      render :new
    end
  end

  private 
    def chirp_params
      params.require(:chirp).permit(:content, :location)
    end

end


# index and show are called actions. These map to views with the same name