class ProfilesController < ApplicationController
  def index
    @profile_id = session[:user_id]
    @user = User.find_by_id session[:user_id]
  end
end
