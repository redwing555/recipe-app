class FoodController < ApplicationController
  def index
    @foods = current_user.foods
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

  def destroy
    @food = Food.find(params[:id])
    @food.destroy!
    flash[:success] = 'Food deleted'
    redirect_to food_index_path
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
