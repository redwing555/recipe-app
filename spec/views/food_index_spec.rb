require 'rails_helper'

RSpec.feature 'Recipes Index Page', type: :feature do
  before(:each) do
    visit new_user_session_path
    @user = User.new(name: "testUser", email: "test@gmail.com", confirmed_at: Time.now, created_at: Time.now, password: 'test11')

    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'test11'
    click_button 'Log in'
  end

  describe 'GET /food' do
    it 'I should see list of recipes title' do
      visit food_index_path
      expect(page).to have_content 'Lists of food'
    end
  end
end
