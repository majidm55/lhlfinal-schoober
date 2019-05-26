class DrivertripsController < ApplicationController
  def create
    drivertrip = DriverTrip.new(drivertrip_params)

    if drivertrip.save!

      flash[:success] = "You have successfully created a new project!"
      redirect_to @drivertrip
    else
      redirect_to '/drivertrips/new'
    end

  end

  def new

  end




private

def drivertrip_params
    params.require(:drivertrip).permit(:start_point, :end_point, :trip_date, :time_slot, :spots_available, :user_id)
end

end