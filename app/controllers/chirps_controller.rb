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

  # display the page to edit an existing chirp
  # Fetches the chirp from the database and stores it in @chirp, so that it can be used when building the form
  def edit 
    @chirp = Chirp.find(params[:id])
  end

  # PUT request to update a chirp
  # Refetch the article from the database and attempts to update it with the submitted form data filtered by chirp_params
  def update
    @chirp = Chirp.find(params[:id])

    if @chirp.update(chirp_params)
      redirect_to @chirp
    else
      render :edit
    end
  end

  private 
    def chirp_params
      params.require(:chirp).permit(:content, :location)
    end

end


# index and show are called actions. These map to views with the same name