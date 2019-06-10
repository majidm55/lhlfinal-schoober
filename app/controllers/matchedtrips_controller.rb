class MatchedtripsController < ApplicationController
  def create
    matchedtrip = MatchedTrip.new(matchedtrip_params) 
    user = User.find_by_id session[:user_id]
    
    if matchedtrip.save!
      flash[:success] = "You have successfully created a new matched trip! Check your phone for a notification"
      #Sends text messages once the matched trip is saved to the database
      client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
      message = client.messages.create from: '+12897686145', to: '+16476714478', body: 'Congratulations. Your Schoober ride has been confirmed for June 6th, 2019'
      
      client = Twilio::REST::Client.new 'ACb741e9fc87daf7681502e6b319377915', '13f0a2097548726d2f2333066e304abd'
      message = client.messages.create from: '+16476976451', to: '+16472482110', body: 'Thank you for Car-pooling up with Schoober. You have a new ride added for June 6th, 2019.'

      redirect_to user
    end
  end

  def show
    @matchedtrip = MatchedTrip.first
  end

  private

  def matchedtrip_params
      params.require(:matchedtrip).permit(:start_point, :end_point, :trip_date, :time_slot, :spots_reserved, :parent_trip_id, :driver_trip_id, :user_id)
  end

end










