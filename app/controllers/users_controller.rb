class UsersController < ApplicationController
  def index
  end

  def destroy
  end

  def show

    @user = User.find params[:id]

    # @matchedtripactive = MatchedTrip.where("trip_date = ?", Date.today).first
    # @matchedtripfuture = MatchedTrip.where("trip_date > ?", Date.today).first
    # @matchedtrippast = MatchedTrip.where("trip_date < ?", Date.today).first
    # @matchedtrip = MatchedTrip.first


    @matchedtripactive = MatchedTrip.where("trip_date = ? AND user_id = ?", Date.today, @user.id).first
    @matchedtripfuture = MatchedTrip.where("trip_date > ? AND user_id = ?", Date.today, @user.id).all
    @matchedtrippast = MatchedTrip.where("trip_date < ? AND user_id = ?", Date.today, @user.id).all


    puts 'matched trip active startpoint'
    puts @matchedtripactive

    if @matchedtripactive
    match_startpoint = Geocoder.search(@matchedtripactive.start_point)
    # match_startpoint_coordinates is an array. lat is at 0 and long is at 1
    @match_startpoint_coordinates = match_startpoint.first.coordinates
    puts 'match_startpoint_coordinates'
    puts @match_startpoint_coordinates

    match_endpoint = Geocoder.search(@matchedtripactive.end_point)
    @match_endpoint_coordinates = match_endpoint.first.coordinates
    puts 'match_endpoint_coordinates'
    puts @match_endpoint_coordinates

    # @hash = Gmaps4rails.build_markers(@matchedtripactive) do |marker|
    #   marker.lat @match_startpoint_coordinates[0]
    #   marker.lng @match_startpoint_coordinates[1]
    # end

    @starthash = Gmaps4rails.build_markers(@matchedtripactive) do |matchedtripactive, marker|
      puts 'matched trip active inspect is.... '
      puts matchedtripactive.inspect

      marker_match_startpoint = Geocoder.search(matchedtripactive.start_point)
      @match_startpoint_coordinates = marker_match_startpoint.first.coordinates
      puts '@match_startpoint_coordinates is ......'
      puts @match_startpoint_coordinates     

      marker_match_endpoint = Geocoder.search(matchedtripactive.end_point)
      @match_endpoint_coordinates = marker_match_endpoint.first.coordinates
      puts '@match_endpoint_coordinates is .....'
      puts @match_endpoint_coordinates



      marker.lat @match_startpoint_coordinates[0]
      marker.lng @match_startpoint_coordinates[1]

      marker.lat @match_endpoint_coordinates[0]
      marker.lng @match_endpoint_coordinates[1]

    end
    
    puts '@starthash is..........'
    puts @starthash


    @endhash = Gmaps4rails.build_markers(@matchedtripactive) do |matchedtripactive, marker|

      marker_match_endpoint = Geocoder.search(matchedtripactive.end_point)
      @match_endpoint_coordinates = marker_match_endpoint.first.coordinates
      puts '@match_endpoint_coordinates is ......'
      puts @match_endpoint_coordinates

      marker.lat @match_endpoint_coordinates[0]
      marker.lng @match_endpoint_coordinates[1]

    end

    puts '@endhash is...........'
    puts @endhash


    @start_location = {
      :lat=>@match_startpoint_coordinates[0],
      :lng=>@match_startpoint_coordinates[1],

      :infowindow=>"<strong>Start Point</strong>",
      :radius => 1609.344,
      :strokeColor => "#FF0000",
      :fillColor => "#000000"
    }
    puts 'start location is'
    puts @start_location

    @end_location = {
      :lat=>@match_endpoint_coordinates[0],
      :lng=>@match_endpoint_coordinates[1],
      :infowindow=>"<strong>End Point</strong>",
      :radius => 1609.344,
      :strokeColor => "#FF0000",
      :fillColor => "#000000"
    }
    puts 'end location is =======>>>>>'
    puts @end_location

  end
    
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








