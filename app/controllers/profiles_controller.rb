class ProfilesController < ApplicationController
  def index
    # @user = User.find params[:id]
    @profile_id = session[:user_id]


  end
# private
#   def profile_params
#     params.require(:drivertrip).permit(:user_id)
# end

end
