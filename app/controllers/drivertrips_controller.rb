class DrivertripsController < ApplicationController
  def create
    drivertrip = DriverTrip.new(drivertrip_params)
    puts "session user id" 
    puts session[:user_id]
    user = User.find_by_id session[:user_id]
    puts "params inspect"
    puts params.inspect

    if drivertrip.save!

      flash[:success] = "You have successfully created a new project!"
      redirect_to user
    else
      redirect_to '/drivertrips/new'
    end

  end

  def new

  end




private

def drivertrip_params
    params.require(:drivertrip).permit(:start_point, :end_point, :trip_date, :time_slot, :user_id, :spots_available)
end

end