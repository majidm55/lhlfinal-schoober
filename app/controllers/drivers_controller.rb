class DriversController < ApplicationController
  
  def index
    @drivers = User.all
  end

  def show
    @driver = User.find params[:id]
    @reviews = Review.where(user_id: params[:id])
    @review = Review.new
  end

end
