class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  def index
    @locations = Location.all
  end

  # GET /locations/1
  def show
    @locations = Location.includes(:patients).where("id = ?", params[:id]).take
  end

  # GET /locations/new
  def new
    #@location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /location
  def create
    #@location = Location.new(location_params)

    #if @location.save
    #  redirect_to @location, notice: 'My location was successfully created.'
    #else
    #  render :new
    #end
  end

  # PATCH/PUT /locations/1
  def update
    #if @location.update(location_params)
    #  redirect_to @location, notice: 'My location was successfully updated.'
    #else
    #  render :edit
    #end
  end

  # DELETE /locations/1
  def destroy
    #@location.destroy
    #redirect_to location_url, notice: 'My location was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def location_params
      params.require(:location)
        .permit(:name, :code,
        )
    end
end
