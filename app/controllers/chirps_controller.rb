# Controllers are Ruby classes, and their public methods are actions
class ChirpsController < ApplicationController

  before_action :set_chirp, only: %i[ show edit update destroy ]
  # if a user isn't authenticated, they can't see anything except the index and show pages
  before_action :authenticate_user!, except: [:home, :show] 
  # only check if this is the correct user for edit, update, and destroy
  before_action :correct_user, only: [:edit, :update, :destroy]

  def home
    @chirps = Chirp.all
  end

  def show
    @chirp = Chirp.find(params[:id])
  end

  # display the page to write a new chirp
  def new
    # @chirp = chirp.new
    # we only want to display the chirps of the current user
    @chirp = current_user.chirps.build
  end

  # POST request to write a new chirp
  def create
    # @chirp = chirp.new(chirp_params)
    @chirp = current_user.chirps.build(chirp_params)
    respond_to do |format|
    if @chirp.save
      format.html { redirect_to @chirp, notice: "Chirp was successfully created." }
      format.json { render :show, status: :created, location: @chirp }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @chirp.errors, status: :unprocessable_entity }
    end
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
    respond_to do |format|
      if @chirp.update(chirp_params)
        format.html { redirect_to @chirp, notice: "Chirp was successfully updated." }
        format.json { render :show, status: :ok, location: @chirp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chirp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE a chirp
  def destroy
    @chirp = Chirp.find(params[:id])
    @chirp.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Chirp was successfully deleted." }
      format.json { head :no_content }
    end 
  end

  def correct_user
    @chirp = current_user.chirps.find_by(id: params[:id])
    redirect_to chirps_path, notice: 'Not Authorized to Edit This Chirp' if @chirp.nil?
  end

  private 
    # Use callbacks to share common setup or constraints between actions.
    def set_chirp
      @chirp = Chirp.find(params[:id])
    end

    def chirp_params
      params.require(:chirp).permit(:content, :location, :user_id)
    end

end


# index and show are called actions. These map to views with the same name