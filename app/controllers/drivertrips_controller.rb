class DrivertripsController < ApplicationController
  def create

#     results = Geocoder.search("Paris")
# results.first.coordinates
# => [48.856614, 2.3522219] 

    drivertrip = DriverTrip.new(drivertrip_params)
    puts "session user id" 
    puts session[:user_id]
    user = User.find_by_id session[:user_id]
    puts "params inspect"
    puts params.inspect
    

    driver_startpoint = Geocoder.search(drivertrip.start_point)

    puts "driver_startpoint errorrrrrrrrr"
    puts driver_startpoint.inspect

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