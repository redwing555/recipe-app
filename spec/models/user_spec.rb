require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject do
      User.create!(name: "testUser", email: "test@gmail.com", password: '123455')
    end
    it 'name should be present' do
      expect(subject.name).to eq 'testUser'
    end
  end
end
