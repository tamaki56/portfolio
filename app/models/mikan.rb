class Mikan < ApplicationRecord
  has_many :recipes, dependent: :destroy
  # belongs_to :recipe_mikan
  has_many_attached :images
  has_many_attached :tip_image

end
