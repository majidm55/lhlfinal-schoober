class UsersController < ApplicationController
  def index
  end

  def destroy
  end

  def show
    @user = User.find params[:id]
    #most recent matchedtripactive will appear on users dashboard
    @matchedtripactive = MatchedTrip.where("trip_date = ? AND user_id = ?", Date.today, @user.id).last
    @matchedtripfuture = MatchedTrip.where("trip_date > ? AND user_id = ?", Date.today, @user.id).all
    @matchedtrippast = MatchedTrip.where("trip_date < ? AND user_id = ?", Date.today, @user.id).all

    if @matchedtripactive
      #Converting starting address to long and lat then sending them through params
      match_startpoint = Geocoder.search(@matchedtripactive.start_point)
      @match_startpoint_coordinates = match_startpoint.first.coordinates
      #Converting end point address to long and lat then sending them through params
      match_endpoint = Geocoder.search(@matchedtripactive.end_point)
      @match_endpoint_coordinates = match_endpoint.first.coordinates
      
      @parent_start_location = {
        :lat=>@match_startpoint_coordinates[0],
        :lng=>@match_startpoint_coordinates[1],
        :infowindow=> "<strong>Your Starting Point</strong>" + 
                      "<div>Address: #{@matchedtripactive.start_point}</div>" +
                      "<div>Date: #{@matchedtripactive.trip_date}</div>" + 
                      "<div>Time: #{@matchedtripactive.time_slot}</div>" + 
                      "<div>Spots Reserved: #{@matchedtripactive.spots_reserved}</div>",
        :radius => 209.344,
        :strokeColor => "#42f442",
        :fillColor => "#42f442",
      }
      
      @end_location = {
        :lat=>@match_endpoint_coordinates[0],
        :lng=>@match_endpoint_coordinates[1],
        :infowindow=> "<div><strong>Your Final Destination</strong></div>"+
                      "<div>Address: #{@matchedtripactive.end_point}</div>"+ 
                      "<div>Date: #{@matchedtripactive.trip_date}</div>" + 
                      "<div>Time: #{@matchedtripactive.time_slot}</div>" +
                      "<div>Spots Reserved: #{@matchedtripactive.spots_reserved}</div>" ,
        :radius => 209.344,
        :strokeColor => "#ffd800",
        :fillColor => "#ffd800",
      }
      
      @driverstartpoint = DriverTrip.where("id = ?", @matchedtripactive.driver_trip_id).first
      driver_startpoint = Geocoder.search(@driverstartpoint.start_point)
      @driver_startpoint_coordinates = driver_startpoint.first.coordinates
      @driver_start_location = {
        :lat=>@driver_startpoint_coordinates[0],
        :lng=>@driver_startpoint_coordinates[1],
        :infowindow=> "<div><strong>Driver's Start Point</strong></div>"+
                      "<div>Address: #{@driverstartpoint.start_point}</div>"+ 
                      "<div>Date: #{@matchedtripactive.trip_date}</div>" + 
                      "<div>Time: #{@matchedtripactive.time_slot}</div>",          
        :radius => 209.344,
        :strokeColor => "#f44141",
        :fillColor => "#f44141"
      }
      #rosedale polygon coordinates to map out the neighbourhood
      @rosedale =
      [
        {
          :lat=>43.675654,
          :lng=>-79.388827,
          :strokeColor => "#f2968a",
          :fillColor => "#f2968a"
        },
        {
          :lat=>43.673334,
          :lng=>-79.386426,
          :strokeColor => "#f2968a",
          :fillColor => "#f2968a"
        },
        {
          :lat=>43.672430,
          :lng=>-79.376797,
          :strokeColor => "#f2968a",
          :fillColor => "#f2968a"
        },
        {
          :lat=>43.672011,
          :lng=>-79.371186,
          :strokeColor => "#f2968a",
          :fillColor => "#f2968a"
        },
        {
          :lat=>43.674766,
          :lng=>-79.366852,
          :strokeColor => "#f2968a",
          :fillColor => "#f2968a"
        },
        {
          :lat=>43.679848,
          :lng=>-79.368848,
          :strokeColor => "#f2968a",
          :fillColor => "#f2968a"
        },
        {
          :lat=>43.689872,
          :lng=>-79.367518,
          :strokeColor => "#f2968a",
          :fillColor => "#f2968a"
        },
        {
          :lat=>43.690640,
          :lng=>-79.373214,
          :strokeColor => "#f2968a",
          :fillColor => "#f2968a"
        },
        {
          :lat=>43.684883,
          :lng=>-79.392504,
          :strokeColor => "#f2968a",
          :fillColor => "#f2968a"
        },
        {
          :lat=>43.675654,
          :lng=>-79.388827,
          :strokeColor => "#f2968a",
          :fillColor => "#f2968a"
        }
      ]
  else
    # no matched trips available...
    @school_location1 = {
      :lat=>43.720370,
      :lng=>-79.413720,
      :infowindow=> "<div><strong>Havergal College</strong></div>"+
                    "<div>Address: 21451 Avenue Rd, North York, ON </div>",
      :radius => 1609.344,
      :strokeColor => "#f44141",
      :fillColor => "#f44141"
    }
    @school_location2 = {
      :lat=>43.733002,
      :lng=>-79.378899,
      :infowindow=> "<div><strong>Crescent School</strong></div>"+
                    "<div>Address: 2365 Bayview Ave, North York, ON </div>",                   
                    
      :radius => 1609.344,
      :strokeColor => "#f44141",
      :fillColor => "#f44141"
    }
    @school_location3 = {
      :lat=>43.690650,
      :lng=>-79.404760,
      :infowindow=> "<div><strong>Upper Canada College</strong></div>"+
                    "<div>Address: 220 Lonsdale Rd, Toronto, ON </div>",
                    
      :radius => 1609.344,
      :strokeColor => "#f44141",
      :fillColor => "#f44141"
    }
    @school_location4 = {
      :lat=>43.666570,
      :lng=>-79.402510,
      :infowindow=> "<div><strong>University of Toronto Schools</strong></div>"+
                    "<div>Address: 371 Bloor St W, Toronto, ON </div>",
                    
      :radius => 1609.344,
      :strokeColor => "#f44141",
      :fillColor => "#f44141"
    }
    end
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/guidelines/index'
    else
      redirect_to '/signup'
    end
  end

  private
  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :driver, :user_pic, :password)
  end

end








