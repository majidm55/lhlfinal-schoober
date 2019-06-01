class DriversController < ApplicationController
  
  def index
    @drivers = User.all
  end

  def show
    @driver = User.find params[:id]
    # @reviews = Review.where(product_id: params[:id])
  end

end
