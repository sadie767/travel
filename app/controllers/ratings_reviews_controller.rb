class ReviewsRatingsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]

  def index
    if params[:search]
      @reviews_ratings = ReviewsRating.search(params[:search])
    else
      @reviews_ratings = ReviewsRating.all
    end
    json_response(@reviews_ratings)
  end

  def show
    @reviews_rating = ReviewsRating.find(params[:id])
    json_response(@reviews_rating)
  end

  def create
    @reviews_rating = ReviewsRating.create!(reviews_ratings_params)
    json_response(@reviews_rating, :created)
  end

  def update
    @reviews_rating = ReviewsRating.find(params[:id])
    if @reviews_rating.update!(reviews_ratings_params)
      render status: 200, json: {
        message: "Your review has successfully been updated!"
      }
    end
  end

  def destroy
    @reviews_rating = ReviewsRating.find(params[:id])
    if @reviews_rating.destroy!
      render status: 200, json: {
        message: "Your review has been destroyed!"
      }
    end
  end

  private

  def reviews_ratings_params
    params.permit(:review, :rating, :destination_id)
  end
end
