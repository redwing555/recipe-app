class FoodController < ApplicationController
  def index
  end

  def new
    @food = Food.new
    @current_user = current_user
  end

  def create
    @food = current_user.foods.new(food_params)

    if @food.save
      flash[:notice] = "New Food created"
      redirect_to food_index_path
    else
      render :new
    end
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
