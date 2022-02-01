class RecipesController < ApplicationController
        skip_before_action :authenticate_user! , only: %i[show public_recipes]
        load_and_authorize_resource except: [:public_recipes]
    def new
        @recipe = Recipe.new
    end

    def index
        @recipes = current_user.recipes.all
    end

    def show
        @recipe = Recipe.find(params[:id])
        @recipe_food = @recipe.recipe_food.includes(:food)
    end


    def public_recipes
        Recipe.includes(:user).where(public:true).order(created_at: :desc)
    end

    def destroy
        previous_url = request.env['HTTP_REFERER']
        recipe = Recipe.find(params[:id])
        if recipe.destroy
            flash[:notice] = 'Recipe successfully deleted'
        else
            flash[:alert] = 'Recipe not deleted! please try again'
        end
        redirect_to(previous_url)
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
    end
end
