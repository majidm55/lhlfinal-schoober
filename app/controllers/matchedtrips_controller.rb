class MatchedtripsController < ApplicationController
  def create
    # look into the params after
    matchedtrip = MatchedTrip.new(parenttrip_params) 
    user = User.find_by_id session[:user_id]
    
    if matchedtrip.save!
      flash[:success] = "You have successfully created a new matched trip!"
      redirect_to user
    end

  end

  # private

  # def parenttrip_params

  #     params.require(:parenttrip).permit(:start_point, :end_point, :trip_date, :time_slot, :user_id, :spots_reserved)
  # end

  

end










