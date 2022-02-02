class RecipeFoodController < ApplicationController

    before_action :current_user_foods, only: %i[new create] 
    def new
        @recipe = Recipe.find(params[:recipe_id])
        @recipe_food = @recipe.recipe_foods.new
    end

    def current_user_foods
        @foods = current_user.foods.collect { |food| [food.name, food.id] }
      end
    

    def create
        @recipe_food= RecipeFood.new(recipe_food_params)
        if @recipe_food.save
            flash[:notice] = "Food added to Recipe successfully!"
            redirect_to recipe_path(@recipe_food.recipe_id)
        else
            flash[:alert] = 'Food not added ! please try again'
            render :new
        end
    end

    def destroy
        @recipe_food = RecipeFood.find(params[:id])
        if @recipe_food.destroy
            flash[:notice] = 'Food removed successfully'
        else
            flash[:alert] = 'Food not removed ! please try again'   
        end

        redirect_to recipe_path(@recipe_food.recipe_id)
    end

    private

    def recipe_food_params
        params.require(:recipe_food).permit(:food_id,:recipe_id, :quantity)
    end
end
