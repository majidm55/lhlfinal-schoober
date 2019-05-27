class ParenttripsController < ApplicationController
  def create
    parenttrip = ParentTrip.new(parenttrip_params)
    user = User.find_by_id session[:user_id]

    if parenttrip.save!

      flash[:success] = "You have successfully created a new parent trip!"
      # redirect_to  "/parenttrips?start_point=#{params[:parenttrip][:start_point]}?end_point=#{params[:parenttrip][:end_point]}"
      redirect_to  "/parenttrips?start_point=#{params[:parenttrip][:start_point]}"
    else
      redirect_to '/parenttrips/new'
    end
  end


  def index
    @drivertrips = DriverTrip.where("start_point = ?", params[:start_point])
    # @drivertrips = DriverTrip.all
  end


  # Client.where("orders_count = #{params[:orders]}")
  # @drivertrips = DriverTrip.where("start_point = #{params[:start_point]}")

  def show
  end

  private

  def parenttrip_params
      params.require(:parenttrip).permit(:start_point, :end_point, :trip_date, :time_slot, :user_id, :spots_required)
  end


end

