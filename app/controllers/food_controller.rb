class FoodController < ApplicationController
  def index
  end

  def new
    @food = Food.new
    @current_user = current_user
  end

  def create
    @food = Food.new(food_params, user_id: current_user)

    if @food.save
      flash[:notice] = "New Food created"
      redirect_to food_index_path
    else
      render :new
    end
  end

  def food_params
    params.permit(:name, :measurement_unit, :price)
  end
end
