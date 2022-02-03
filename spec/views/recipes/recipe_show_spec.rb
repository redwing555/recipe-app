require 'rails_helper'

RSpec.feature 'Recipes Index Page', type: :feature do
    before(:each) do
        visit new_user_session_path
        @user1 = User.new( name: "testUser", email: "test@gmail.com",confirmed_at: Time.now, created_at:Time.now, password: 'test11')
        
        recipe1 = Recipe.create!(name: 'Recipe1', preparation_time: 1,  cooking_time: 2, description: 'lorem upsum1',user: @user1, user_id: @user1.id,public: true)
        food1 = Food.create!(name: 'Chocolate', measurement_unit: "g", price: 10, user_id: @user1.id)
        @recipe_food1 = RecipeFood.create!(quantity:"1",recipe: recipe1, food: food1)

         fill_in 'Email', with: 'test@gmail.com'
         fill_in 'Password', with: 'test11'
         click_button 'Log in'
         visit recipes_path
        click_link 'Recipe1'
      end

      describe 'GET /show' do
        scenario 'I should see details of the recipe' do

            expect(page).to have_content(@user1.recipes[0].name)
            expect(page.find('input.form-check-input')).to be_checked
             expect(page).to have_content("Prep Time: #{@user1.recipes[0].preparation_time}")
            expect(page).to have_content("Cook Time: #{@user1.recipes[0].cooking_time}")
            expect(find_link('Add Ingredient').visible?).to be true
            expect(find_link('Generate Shopping List').visible?).to be true
            expect(page).to have_content(@recipe_food1.food.name)
            expect(page).to have_content("€#{@recipe_food1.food.price * @recipe_food1.quantity}")
            expect(page).to have_content(@recipe_food1.quantity)
            

        end

    end
end