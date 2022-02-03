require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Fields validations' do
    subject do
      @user1 = User.new(name: "testUser", email: "test@gmail.com")
      Recipe.create!(name: 'Recipe', preparation_time: 1, cooking_time: 2, description: 'lorem upsum', user: @user1, user_id: @user1.id)
    end
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'preparation time should be present' do
      subject.preparation_time = nil
      expect(subject).to_not be_valid
    end

    it 'cooking time should be present' do
      subject.cooking_time = nil
      expect(subject).to_not be_valid
    end

    it 'description should be present' do
      subject.description = nil
      expect(subject).to_not be_valid
    end
  end
end
