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


    puts 'matched trip active is........................ !!!!!!!!!!!!!!!!'
    puts @matchedtripactive.inspect

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

    # @starthash = Gmaps4rails.build_markers(@matchedtripactive) do |matchedtripactive, marker|
    #   puts 'matched trip active inspect is.... '
    #   puts matchedtripactive.inspect

    #   marker_match_startpoint = Geocoder.search(matchedtripactive.start_point)
    #   @match_startpoint_coordinates = marker_match_startpoint.first.coordinates
    #   puts '@match_startpoint_coordinates is ......'
    #   puts @match_startpoint_coordinates     

    #   marker_match_endpoint = Geocoder.search(matchedtripactive.end_point)
    #   @match_endpoint_coordinates = marker_match_endpoint.first.coordinates
    #   puts '@match_endpoint_coordinates is .....'
    #   puts @match_endpoint_coordinates



    #   marker.lat @match_startpoint_coordinates[0]
    #   marker.lng @match_startpoint_coordinates[1]

    #   marker.lat @match_endpoint_coordinates[0]
    #   marker.lng @match_endpoint_coordinates[1]

    # end
    
    # puts '@starthash is..........'
    # puts @starthash


    # @endhash = Gmaps4rails.build_markers(@matchedtripactive) do |matchedtripactive, marker|

    #   marker_match_endpoint = Geocoder.search(matchedtripactive.end_point)
    #   @match_endpoint_coordinates = marker_match_endpoint.first.coordinates
    #   puts '@match_endpoint_coordinates is ......'
    #   puts @match_endpoint_coordinates

    #   marker.lat @match_endpoint_coordinates[0]
    #   marker.lng @match_endpoint_coordinates[1]

    # end

    # puts '@endhash is...........'
    # puts @endhash

    
    @start_location = {
      :lat=>@match_startpoint_coordinates[0],
      :lng=>@match_startpoint_coordinates[1],

      :infowindow=> "<strong>Starting Point Schoober</strong>" + 
                    "<div>Address: #{@matchedtripactive.start_point}</div>" + 
                    "<div>Time: #{@matchedtripactive.time_slot}</div>" + 
                    "<div>Spots Reserved: #{@matchedtripactive.spots_reserved}</div>",
      :radius => 1609.344,
      :strokeColor => "#42f442",
      :fillColor => "#42f442"
    }
    puts 'start location is'
    puts @start_location

    @end_location = {
      :lat=>@match_endpoint_coordinates[0],
      :lng=>@match_endpoint_coordinates[1],
      :infowindow=> "<div><strong>Schoober: Final Destination</strong></div>"+
                    "<div>Address: #{@matchedtripactive.end_point}</div>"+ 
                    "<div>Time: #{@matchedtripactive.time_slot}</div>" +
                    "<div>Spots Reserved: #{@matchedtripactive.spots_reserved}</div>" ,
                    
                    
      :radius => 1609.344,
      :strokeColor => "#f44141",
      :fillColor => "#f44141"
    }
    puts 'end location is =======>>>>>'
    puts @end_location

  end
    
end



# var contentString = '<div id="content">'+
# '<div id="siteNotice">'+
# '</div>'+
# '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
# '<div id="bodyContent">'+
# '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
# 'sandstone rock formation in the southern part of the '+
# 'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
# 'south west of the nearest large town, Alice Springs; 450&#160;km '+
# '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
# 'features of the Uluru - Kata Tjuta National Park. Uluru is '+
# 'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
# 'Aboriginal people of the area. It has many springs, waterholes, '+
# 'rock caves and ancient paintings. Uluru is listed as a World '+
# 'Heritage Site.</p>'+
# '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
# 'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
# '(last visited June 22, 2009).</p>'+
# '</div>'+
# '</div>';



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








