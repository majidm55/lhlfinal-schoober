class ParenttripsController < ApplicationController
  def create
    @parenttrip = ParentTrip.new(parenttrip_params)
    #user = User.find_by_id session[:user_id]
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

  def new
    #list of School params that are intended for Parent Endpoints
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


  def show
    selectedDriverTrips = []
    driverTripCoordinates = []
    @parenttrips = ParentTrip.find params[:id]
    @user = User.find_by_id session[:user_id]
    @index = 0
    #Converts parent's address to long and lat
    parent_startpoint = Geocoder.search(@parenttrips.start_point)
    #this error will oddly hit when Parent adds their postal code in their address
    if parent_startpoint == []
      flash[:alert] = "Wrong Address Inputed"
      redirect_to '/parenttrips/new' 
    else    
      parent_coordinates = parent_startpoint.first.coordinates
      @drivertrips = DriverTrip.where(end_point: @parenttrips.end_point, time_slot: @parenttrips.time_slot, trip_date: @parenttrips.trip_date)

      index = 0
      @drivertrips.each do |drivertrip| 
        index += 1
      
        # change address from driver trips point A to long and lat
        driver_startpoint = Geocoder.search(drivertrip.start_point)
        driver_coordinates = driver_startpoint.first.coordinates
        driver_startlocation = {
          :lat => driver_coordinates[0],
          :lng => driver_coordinates[1],
          :infowindow=> "<strong>Driver: #{drivertrip.user_id}</strong>" + 
          "<div>Address: #{drivertrip.start_point}</div>" +
          "<div>Date: #{drivertrip.trip_date}</div>" + 
          "<div>Time: #{drivertrip.time_slot}</div>" + 
          "<div>Spots Reserved: #{drivertrip.spots_available}</div>",
          :radius => 209.344,
          :strokeColor => "#0000FF",
          :fillColor => "#0000FF"
        }

        driverTripCoordinates.push(driver_startlocation)
        #Terminal will display distance between the two points
        puts 'distance between driver startpoint and parent startpoint'
        puts Geocoder::Calculations.distance_between(driver_coordinates, parent_coordinates)

        distanceBetweenStartPoints = Geocoder::Calculations.distance_between(driver_coordinates, parent_coordinates)
        # if point A of driver trip and point A of parent trip is close enough, then put them into filter trips array
        if distanceBetweenStartPoints < 5
            selectedDriverTrips.push(drivertrip)
        end
        # this end closes the loop
      end



        # from the filter array, display into show page
        @selectedDriverTrips = selectedDriverTrips
        @drivercoordinates = driverTripCoordinates

        @parent_startlocation = {
          :lat=>parent_coordinates[0],
          :lng=>parent_coordinates[1],
          :infowindow=> "<strong>You</strong>" + 
                        "<div>Address: #{@parenttrips.start_point}</div>" +
                        "<div>Date: #{@parenttrips.trip_date}</div>" + 
                        "<div>Time: #{@parenttrips.time_slot}</div>" + 
                        "<div>Spots Reserved: #{@parenttrips.spots_required}</div>",
          :radius => 209.344,
          :strokeColor => "#42f442",
          :fillColor => "#42f442"
        }

        school_point = Geocoder.search(@parenttrips.end_point)
        school_coordinates = school_point.first.coordinates

        @school_location = {
          :lat=>school_coordinates[0],
          :lng=>school_coordinates[1],
          :infowindow=> "<strong>Schoober Designated School</strong>" + 
                        "<div>Address: #{@parenttrips.end_point}</div>",
          :radius => 209.344,
          :strokeColor => "#42f442",
          :fillColor => "#42f442"
        }

        if (selectedDriverTrips == [])
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

  #Google Maps 4 Rails polygon of Rosedale Neighborhood
  #Scalability- add all the neighborhoods of Toronto
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
      }]
    end
  end 

  def parenttrip_params
      params.require(:parenttrip).permit(:start_point, :end_point, :trip_date, :time_slot, :user_id, :spots_required)
  end

end

