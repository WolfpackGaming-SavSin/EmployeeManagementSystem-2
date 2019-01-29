class LocationsController < ApplicationController
  include Pundit

  before_action :find_location, only: [:edit, :update, :show, :destroy]

  def index
    @locations = Location.paginate(page: params[:page], per_page: 10)
    authorize Location
  end

  def new
    @location = Location.new
    authorize @location
  end

  def create
    @location = Location.new(permitted_attributes(Location))
    authorize @location
    if @location.save
      flash[:success] = "Location added successfully"
      redirect_to locations_path
    else
      render 'new'
    end
  end

  def edit
    authorize @location
  end

  def update
    authorize @location
    if @location.update(permitted_attributes(@location))
      flash[:success] = "Location updated successfully"
      redirect_to location_path(@location)
    else
      render 'edit'
    end
  end

  def show
    authorize @location
  end

  def destroy
    @location.destroy
    flash[:danger] = "Location has been deleted."
  end

  private
  def find_location
    @location = Location.find(params[:id])
  end
end
