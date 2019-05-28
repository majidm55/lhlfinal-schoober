class ParenttripsController < ApplicationController
  def create
    @parenttrip = ParentTrip.new(parenttrip_params)
    user = User.find_by_id session[:user_id]

    if @parenttrip.save!

      flash[:success] = "You have successfully created a new parent trip!"
      # redirect_to  "/parenttrips?start_point=#{params[:parenttrip][:start_point]}?end_point=#{params[:parenttrip][:end_point]}"
      # redirect_to  "/parenttrips?start_point=#{params[:parenttrip][:start_point]}"
      redirect_to parenttrip_path(@parenttrip)
    else
      redirect_to '/parenttrips/new'
    end
  end


  def index
    # @drivertrips = DriverTrip.where("start_point = ?", params[:start_point])
    @drivertrips = DriverTrip.all
    
  end


  # Client.where("orders_count = #{params[:orders]}")
  # @drivertrips = DriverTrip.where("start_point = #{params[:start_point]}")

  def show
    @parenttrips = ParentTrip.find params[:id]
    parent_startpoint = Geocoder.search(@parenttrips.start_point)

    puts 'parent_coordinates'
    # puts parent_startpoint.first.coordinates
    parent_coordinates = parent_startpoint.first.coordinates



    @drivertrips = DriverTrip.all

    # change .each to sort_by 
    @drivertrips.each do |drivertrip| 
      puts 'drivertrip startpoint'
      puts drivertrip.start_point


      driver_startpoint = Geocoder.search(drivertrip.start_point)

      puts 'driver coordinates'
      # puts driver_startpoint.first.coordinates
      driver_coordinates = driver_startpoint.first.coordinates

    puts 'distance between driver startpoint and parent startpoint'
    puts Geocoder::Calculations.distance_between(driver_coordinates, parent_coordinates)
    
    end
  # end.first

  # target = array.sort_by { |x|
  
  # }.first


    # puts "parents trips inspecting"
    # puts @parenttrips.inspect

    # puts "parent trips point A"
    # puts @parenttrips.start_point

    

    # puts "paris lat long is ........"
    # puts results.first.coordinates
    # @driver trips is an array

    puts "distance testing"
    puts Geocoder::Calculations.distance_between([47.858205,2.294359], [40.748433,-73.985655])
    








    # use geocoder inside here

    

    # change address from driver trips point A to long and lat

    # change address from parent trips point A to long and lat

    # if point A of driver trip and point A of parent trip is close enough, then put them into filter trips array

    # from the filter array, display into show page



    puts "parent trips is ........"
    puts @parenttrips
    # @reviews = Review.where(product_id: params[:id])
    # lets hits the show of parent controller when we submit
  end



  def parenttrip_params

      params.require(:parenttrip).permit(:start_point, :end_point, :trip_date, :time_slot, :user_id, :spots_required)
  end


end







# class Admin::CategoriesController < Admin::BaseController

#   def index
#     @categories = Category.order(id: :asc).all
#   end

#   def new
#     @category = Category.new
#   end

#   def create
#     @category = Category.new(category_params)

#     if @category.save
#       redirect_to [:admin, :categories], notice: 'Product created!'
#     else
#       render :new
#     end
#   end

#   private

#   def category_params
#     params.require(:category).permit(
#       :name
#     )
#   end

# end