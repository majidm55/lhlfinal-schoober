class MatchedtripsController < ApplicationController
  def create

    puts 'parent_trip_id'
    puts params
    # look into the params after
    matchedtrip = MatchedTrip.new(matchedtrip_params) 
    user = User.find_by_id session[:user_id]
    

    
    if matchedtrip.save!
      flash[:success] = "You have successfully created a new matched trip!"
      redirect_to user
    end

  end

  def show
    @matchedtrip = MatchedTrip.first
  end

  private

  def matchedtrip_params

      params.require(:matchedtrip).permit(:start_point, :end_point, :trip_date, :time_slot, :spots_reserved, :parent_trip_id, :driver_trip_id)
  end

  

end










