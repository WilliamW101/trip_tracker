class AddressesController < ApplicationController
  before_action :find_location
  before_action :find_trip
  before_action :set_address, except: [:index, :new, :create]

  def index
    @addresses = Address.all
  end

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to trip_location_address_path(@trip, @location, @address)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to trip_location_address_path(@trip, @location, @address)
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to trip_location_addresses_path(@trip, @location)
  end

  private
    def set_address
      @address = Address.find(params[:id])
    end

    def find_location
      @location = Location.find(params[:location_id])
    end

    def find_trip
      @trip = Trip.find(params[:trip_id])
    end

    def address_params
      params.require(:address).permit(:loc, :city, :state, :zip)
    end
end
