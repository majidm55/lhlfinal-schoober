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

  # make sure to comment ou before testing
  # @users = User.all
  # @hash = Gmaps4rails.build_markers(@users) do |user, marker|
  #   marker.lat user.latitude
  #   marker.lng user.longitude
  # end

  # @hash = Gmaps4rails.build_markers(@matchedtripactive) do |matchedtripactive, marker|
  #   marker.lat matchedtripactive.latitude
  #   marker.lng matchedtripactive.longitude
  # end


#   function(){
#     // console.log ("maps running on show");
#     markers = handler.addMarkers(<%=raw @hash.to_json %>);
#     <% if @search_location %>
#     handler.addCircles([<%=raw @search_location.to_json%>]);
#     markers = handler.addMarker(<%=raw @search_location.to_json%>);
#     <% end %>
#     handler.bounds.extendWith(markers);
#     handler.fitMapToBounds();
#     handler.getMap().setZoom(10);
# }








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








# Visily's code
# def show
#   if params[:param]
#     @matchedtrip = MatchedTrip.find_markets_around_me(params[:param], 1)

#   @matchedtrips = MatchedTrip.where(end_point: @parenttrips.end_point, time_slot: @parenttrips.time_slot, trip_date: @parenttrips.trip_date)
  
#   @drivertrips = DriverTrip.where(end_point: @parenttrips.end_point, start_point: @match)


#     @hash = Gmaps4rails.build_markers(@market) do |market, marker|
#       marker.lat market.lat
#       marker.lng market.long
#       marker.infowindow "<strong>#{market.name}</strong>"
#     end
#     search_location_raw = Geocoder.coordinates(params[:param])
#     @search_location = {
#       :lat=>search_location_raw[0],
#       :lng=>search_location_raw[1],
#       :infowindow=>"<strong>Location_Searched</strong>",
#       :radius => 1609.344,
#       :strokeColor => "#FF0000",
#       :fillColor => "#000000"
#     }
#     puts @search_location

#   else
#     @market = Market.all
#     @hash = Gmaps4rails.build_markers(@market) do |market, marker|
#       marker.lat market.lat
#       marker.lng market.long
#       marker.infowindow "<strong>#{market.name}</strong>"
#     end
#   end
# end
