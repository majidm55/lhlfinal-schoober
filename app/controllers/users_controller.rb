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

    if @matchedtripactive.inspect == nil
      puts 'please be nice'
      match_startpoint = Geocoder.search(@matchedtripactive.start_point)
      # match_startpoint_coordinates is an array. lat is at 0 and long is at 1
      @match_startpoint_coordinates = match_startpoint.first.coordinates
      puts 'match_startpoint_coordinates'
      puts @match_startpoint_coordinates

      match_endpoint = Geocoder.search(@matchedtripactive.end_point)
      @match_endpoint_coordinates = match_endpoint.first.coordinates
      puts 'match_endpoint_coordinates'
      puts @match_endpoint_coordinates
      
      @start_location = {
        :lat=>@match_startpoint_coordinates[0],
        :lng=>@match_startpoint_coordinates[1],

        :infowindow=> "<strong>Schoober: Starting Point</strong>" + 
                      "<div>Address: #{@matchedtripactive.start_point}</div>" +
                      "<div>Date: #{@matchedtripactive.trip_date}</div>" + 
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
                      "<div>Date: #{@matchedtripactive.trip_date}</div>" + 
                      "<div>Time: #{@matchedtripactive.time_slot}</div>" +
                      "<div>Spots Reserved: #{@matchedtripactive.spots_reserved}</div>" ,
                      
                      
        :radius => 1609.344,
        :strokeColor => "#f44141",
        :fillColor => "#f44141"
      }
      puts 'end location is =======>>>>>'
      puts @end_location

  else
    puts 'no matched trips available...'
    @start_location = {
      :lat=>43.738620,
      :lng=>-79.360510,
      :infowindow=> "<div><strong>Parent 1 </strong></div>"+
                    "<div>Address: 28 Leacroft Cres., North York, ON </div>"+ 
                    "<div>Date: June 06, 2019</div>" + 
                    "<div>Time: 3:00 pm - 4:00 pm</div>" +
                    "<div>Spots Reserved: 1 </div>" ,
                    
                    
      :radius => 1609.344,
      :strokeColor => "#f44141",
      :fillColor => "#f44141"
    }

    @end_location = {
      :lat=>43.733002,
      :lng=>-79.378899,
      :infowindow=> "<div><strong>Crescent School</strong></div>"+
                    "<div>Address: 2365 Bayview Ave, North York, ON </div>"+ 
                    "<div>Date: June 06, 2019</div>" + 
                    "<div>Time: 3:00 pm - 4:00 pm</div>" +
                    "<div>Spots Available: 1 </div>" ,
                    
                    
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








