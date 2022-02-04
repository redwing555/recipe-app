require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  before { visit new_user_session_path }

  scenario 'Page should have a login form' do
    expect(page.has_field?('Email')).to be true
    expect(page.has_field?('Password')).to be true
    expect(page.has_button?('Log in')).to be true
  end

  context 'From submission test' do
    scenario 'From submission without email and password' do
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    scenario 'From submission with wrong email and password' do
      test_user = User.new(name: 'test', email: 'test@gmail.com', password: '11335577')
      test_user.skip_confirmation!
      test_user.save!

      fill_in 'Email', with: 'test@email.com'
      fill_in 'Password', with: '11357'

      click_button 'Log in'

      expect(page).to have_content 'Invalid Email or password.'
    end

    scenario 'From submission with correct email and password' do
      test_user = User.new(name: 'test', email: 'test@gmail.com', password: '11335577')
      test_user.skip_confirmation!
      test_user.save!

      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: '11335577'

      click_button 'Log in'

      expect(page).to have_current_path root_path
      expect(page).to have_content 'Signed in successfully.'
    end
  end
end
