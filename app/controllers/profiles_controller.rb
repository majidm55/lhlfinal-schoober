class ProfilesController < ApplicationController
  def index
    # @user = User.find params[:id]
    @profile_id = session[:user_id]
    @user = User.find_by_id session[:user_id]



  end




end
