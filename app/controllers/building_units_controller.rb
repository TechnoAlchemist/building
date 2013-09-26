class BuildingUnitsController < ApplicationController
  def new
    @building_unit = BuildingUnit.new
  end

  def create
    @building_unit = BuildingUnit.new(building_unit_params)
    if @building_unit.save
      flash[:notice] = "Building entry was successfully submitted"
      redirect_to building_unit_path(@building_unit)
    else
      flash[:notice] = "Enter the required fields and resubmit"
      render new_building_unit_path
    end
  end

  def show
    @building_unit = BuildingUnit.find(params[:id])
  end

  private
  def building_unit_params
    params.require(:building_unit).permit(:street_address, :city, :state, :postal_code)
  end 

end
