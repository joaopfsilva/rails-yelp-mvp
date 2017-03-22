class ReviewsController < ApplicationController
  def index         # GET /reviews
  end

  def show          # GET /reviews/:id
  end

  def new           # GET /reviews/new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create        # POST /reviews
    @review = Review.new(review_params)
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render :new
    end
  end

  def edit          # GET /reviews/:id/edit
  end

  def update        # PATCH /reviews/:id
  end

  def destroy       # DELETE /reviews/:id
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end


