class UsersController < ApplicationController
  def index
  end

  def destroy
  end

  def show
    @user = User.find params[:id]
    @matchedtripactive = MatchedTrip.where("trip_date = ?", Date.today).first
    @matchedtripfuture = MatchedTrip.where("trip_date > ?", Date.today).first
    @matchedtrippast = MatchedTrip.where("trip_date < ?", Date.today).first
    # @matchedtrip = MatchedTrip.first


    match_startpoint = Geocoder.search(@matchedtripactive.start_point)
    # match_startpoint_coordinates is an array. lat is at 0 and long is at 1
    @match_startpoint_coordinates = match_startpoint.first.coordinates
    puts 'match_startpoint_coordinates'
    puts @match_startpoint_coordinates

    match_endpoint = Geocoder.search(@matchedtripactive.end_point)
    @match_endpoint_coordinates = match_endpoint.first.coordinates
    puts 'match_endpoint_coordinates'
    puts @match_endpoint_coordinates

    
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      #redirect_to user
      redirect_to user
    else
      redirect_to '/signup'
    end
  end


  private

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :driver, :user_pic, :password)
  end

end








def show
  selectedDriverTrips = []

  @parenttrips = ParentTrip.find params[:id]
  @index = 0
  # change address from parent trips point A to long and lat
  parent_startpoint = Geocoder.search(@parenttrips.start_point)
  parent_coordinates = parent_startpoint.first.coordinates

  # @drivertrips = DriverTrip.all

  @drivertrips = DriverTrip.where(end_point: @parenttrips.end_point, time_slot: @parenttrips.time_slot, trip_date: @parenttrips.trip_date)
  
  # change .each to sort_by 
  @drivertrips.each do |drivertrip| 
    # change address from driver trips point A to long and lat
    a = Time.now
    driver_startpoint = Geocoder.search(drivertrip.start_point)
    b = Time.now
    @index += 1
    puts 'time difference'
    puts b-a
    puts 'index'
    puts @index
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