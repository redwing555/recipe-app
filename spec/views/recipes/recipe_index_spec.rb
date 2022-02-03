require 'rails_helper'

RSpec.feature 'Recipes Index Page', type: :feature do
    before(:each) do
        visit new_user_session_path
        @user1 = User.new( name: "testUser", email: "test@gmail.com",confirmed_at: Time.now, created_at:Time.now, password: 'test11')
        
        recipe1 = Recipe.create!(name: 'Recipe1', preparation_time: 1,  cooking_time: 2, description: 'lorem upsum1',user: @user1, user_id: @user1.id)
        recipe2 = Recipe.create!(name: 'Recipe2', preparation_time: 1,  cooking_time: 2, description: 'lorem upsum2',user: @user1, user_id: @user1.id)
        recipe3 = Recipe.create!(name: 'Recipe3', preparation_time: 1,  cooking_time: 2, description: 'lorem upsum3',user: @user1, user_id: @user1.id)
         fill_in 'Email', with: 'test@gmail.com'
         fill_in 'Password', with: 'test11'
         click_button 'Log in'
        
        visit recipes_path
      end

      describe 'GET /index' do
        scenario 'I should see list of recipes link / public recipes link' do
            
        
        expect(find_link('View public recipes').visible?).to be true
        expect(page).to have_content 'List of Recipes'
        end
    
        scenario 'I should be redirected to add new recipe page' do
          click_link 'Add Recipe'
          expect(current_path).to eq new_recipe_path
        end
    
        scenario 'I should see recipes list with name and description and remove button in the body' do
            expect(page).to have_content 'Recipe1'
            expect(page).to have_content 'lorem upsum1'
            expect(page).to have_button 'Remove'

            expect(page).to have_content 'Recipe2'
            expect(page).to have_content 'lorem upsum2'
            expect(page).to have_button 'Remove'

            expect(page).to have_content 'Recipe3'
            expect(page).to have_content 'lorem upsum3'
            expect(page).to have_button 'Remove'
        end
       end
end