class LocationsController < ApplicationController
  before_action :find_trip
  before_action :set_location, except: [:index, :new, :create]

  def index
    @locations = @trip.locations
  end

  def show
  end

  def new
    @location = @trip.locations.new
  end

  def create
    @location = @trip.locations.new(location_params)
      if @location.save
        redirect_to trip_location_path(@trip, @location)
      else
        render :new
      end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to trip_location_path
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to trip_locations_path
  end

  private
    def find_trip
      @trip = Trip.find(params[:trip_id])
    end

    def location_params
      params.require(:location).permit(:place)
    end

    def set_location
      @location = @trip.locations.find(params[:id])
    end
end
