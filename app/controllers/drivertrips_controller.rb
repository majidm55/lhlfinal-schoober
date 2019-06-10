class DrivertripsController < ApplicationController

  def create
    drivertrip = DriverTrip.new(drivertrip_params)  
    #Converts driver's startpoint address to long and lat  
    driver_startpoint = Geocoder.search(drivertrip.start_point)

    if driver_startpoint == []
      flash[:alert] = "Incorrect start location"
      redirect_to '/drivertrips/new'
    elsif drivertrip.save!
      flash[:success] = "You have successfully created a new driver trip!"
      redirect_to '/'
    end
  end

  def new

  end

private

def drivertrip_params
    params.require(:drivertrip).permit(:start_point, :end_point, :trip_date, :time_slot, :user_id, :spots_available)
end

end