class RecipeTag < ApplicationRecord
  belongs_to :recipe
  has_many :tags, dependent: :destroy
end
