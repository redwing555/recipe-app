class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates_numericality_of :quantity, greater_than: 0
  validates :recipe, uniqueness: { scope: :food, message: 'already added into food by you' }
end
