require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.new(id: 1, name: 'Al', email: 'al@example.com', encrypted_password: 'password', confirmed_at: Time.now)
    @food = Food.new(name: 'Food 1', measurement_unit: 3, price: 2, user_id: @user.id)
  end

  describe 'food validation tests' do
    it 'validates the presence of the name is nil' do
      @food.name = nil
      expect(@food).to_not be_valid
    end

    it 'validates the presence of the measurement unit nil' do
      @food.measurement_unit = nil
      expect(@food).to_not be_valid
    end

    it 'validates the presence of the price nil' do
      @food.price = nil
      expect(@food).to_not be_valid
    end

    it 'validates the presence of the user nil' do
      @food.user_id = nil
      expect(@food).to_not be_valid
    end

    it 'validates the presence of the user nil' do
      @food.user_id = nil
      expect(@food).to_not be_valid
    end

    it 'validates the food name match' do
      expect(@food.name).to eq "Food 1"
    end

    it 'validates the user_id match' do
      expect(@food.user_id).to eq 1
    end
  end
end
