class ParenttripsController < ApplicationController
  def create
    @parenttrip = ParentTrip.new(parenttrip_params)
    user = User.find_by_id session[:user_id]

    if @parenttrip.save!

      flash[:success] = "You have successfully created a new parent trip!"
      redirect_to parenttrip_path(@parenttrip)
    else
      redirect_to '/parenttrips/new'
    end
  end


  def index
    @drivertrips = DriverTrip.all
  end


  def show
    selectedDriverTrips = []

    @parenttrips = ParentTrip.find params[:id]
    @user = User.find_by_id session[:user_id]
    @index = 0

    parent_startpoint = Geocoder.search(@parenttrips.start_point)
    parent_coordinates = parent_startpoint.first.coordinates

    @drivertrips = DriverTrip.where(end_point: @parenttrips.end_point, time_slot: @parenttrips.time_slot, trip_date: @parenttrips.trip_date)
    
    @drivertrips.each do |drivertrip| 
      # change address from driver trips point A to long and lat
      driver_startpoint = Geocoder.search(drivertrip.start_point)

      driver_coordinates = driver_startpoint.first.coordinates

      puts 'distance between driver startpoint and parent startpoint'
      puts Geocoder::Calculations.distance_between(driver_coordinates, parent_coordinates)

      distanceBetweenStartPoints = Geocoder::Calculations.distance_between(driver_coordinates, parent_coordinates)
      # if point A of driver trip and point A of parent trip is close enough, then put them into filter trips array
      if distanceBetweenStartPoints < 1
          selectedDriverTrips.push(drivertrip)
      end
    # this end closes the loop
    end
    # from the filter array, display into show page
    @drivertrips = selectedDriverTrips
  end
    

  def parenttrip_params
      params.require(:parenttrip).permit(:start_point, :end_point, :trip_date, :time_slot, :user_id, :spots_required)
  end


end

