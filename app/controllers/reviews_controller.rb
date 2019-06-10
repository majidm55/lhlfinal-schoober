class ReviewsController < ApplicationController

  def create
    new_review_param = { "comment" => review_params[:comment], "rating" => review_params[:rating], "user_id" => params[:driver_id] }
    @review = Review.new new_review_param
    if @review.save!
      redirect_to "/drivers/#{params[:driver_id]}", notice: "Review created"
    else
      redirect_to "/drivers/#{params[:driver_id]}", notice: "There was an error creating the comment: #{@review.errors.full_messages}"
    end
  end

  private
    def review_params
        params.require(:review).permit(:comment, :rating)
    end
end



