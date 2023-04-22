class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :food, uniqueness: { scope: :recipe, case_sensitive: false, message: 'already exists in this recipe' }
end
