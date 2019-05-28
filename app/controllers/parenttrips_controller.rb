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
    selectedDriverTrips = []

    @parenttrips = ParentTrip.find params[:id]
    @index = 0
    # change address from parent trips point A to long and lat
    parent_startpoint = Geocoder.search(@parenttrips.start_point)
    parent_coordinates = parent_startpoint.first.coordinates

    # @drivertrips = DriverTrip.all

    @drivertrips = DriverTrip.where(end_point: @parenttrips.end_point, time_slot: @parenttrips.time_slot, trip_date: @parenttrips.trip_date)
    
    puts "check params ......."
    puts @checkParams

    # id |           start_point            |            end_point             | trip_date  |      time_slot      | spots_available | user_id |         created_at         |         updated_at         | lat | long 

    # id |            start_point             |             end_point              | trip_date  |      time_slot      | spots_required | user_id |         created_at         |         updated_at         | lat | long 

    # change .each to sort_by 
    @drivertrips.each do |drivertrip| 
      # change address from driver trips point A to long and lat
      a = Time.now
      driver_startpoint = Geocoder.search(drivertrip.start_point)
      b = Time.now
      @index += 1
      puts 'time difference'
      puts b-a
      puts 'index'
      puts @index
      driver_coordinates = driver_startpoint.first.coordinates

      puts 'distance between driver startpoint and parent startpoint'
      puts Geocoder::Calculations.distance_between(driver_coordinates, parent_coordinates)

      distanceBetweenStartPoints = Geocoder::Calculations.distance_between(driver_coordinates, parent_coordinates)
      # if point A of driver trip and point A of parent trip is close enough, then put them into filter trips array
      if distanceBetweenStartPoints < 1
          selectedDriverTrips.push(drivertrip)
      end
  # this end closes the loop
    end
    # from the filter array, display into show page
    @drivertrips = selectedDriverTrips
  end
    
  # end.first

  # target = array.sort_by { |x|
  
  # }.first



  

 

   

    

    # from the filter array, display into show page

    # change address from driver trips point B to long and lat

    # change address from parent trips point B to long and lat

    # change





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