class Mikan < ApplicationRecord
  has_many :recipes, dependent: :destroy
  # belongs_to :recipe_mikan
end
