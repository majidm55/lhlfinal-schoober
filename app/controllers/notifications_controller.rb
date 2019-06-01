class NotificationsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def notify

        puts "Soumya's Phone number"
        user = User.find_by_id session[:user_id]
        puts "Parent's Phone number"
        puts user.phone

        client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
        message = client.messages.create from: '+12897686145', to: '+16476714478', body: 'Congratulations. You ride is confirmed.'
        message = client.messages.create from: '+12897686145', to: '+16472482110', body: 'Congratulations. You have a new ride added.'
        render plain: message.status
    end
  
  end