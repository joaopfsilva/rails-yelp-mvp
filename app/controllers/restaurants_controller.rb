class RestaurantsController < ApplicationController

  before_action :do_more_magic, only: [:show, :edit, :update, :destroy]

  def index         # GET /restaurants
    @restaurants = Restaurant.all
  end

  def show          # GET /restaurants/:id
    @reviews = Review.where(restaurant_id: @restaurant.id)

  end

  def new           # GET /restaurants/new
    @restaurant = Restaurant.new
  end

  def create        # POST /restaurants
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
     else
      render :new
    end
  end

  def edit          # GET /restaurants/:id/edit
  end

  def update        # PATCH /restaurants/:id
    redirect_to restaurant(@restaurant)
  end

  def destroy       # DELETE /restaurants/:id
    @restaurant.destroy
    redirect_to restaurants
  end

  private

  def do_more_magic()
    @restaurant = Restaurant.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
