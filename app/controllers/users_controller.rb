class UsersController < ApplicationController
  def index
  end

  def destroy
  end

  def show
    @user = User.find params[:id]
    @matchedtripactive = MatchedTrip.where("trip_date = ?", Date.today).first
    @matchedtripfuture = MatchedTrip.where("trip_date > ?", Date.today).first
    @matchedtrippast = MatchedTrip.where("trip_date < ?", Date.today).first
    # @matchedtrip = MatchedTrip.first
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
