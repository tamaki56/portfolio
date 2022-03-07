class Mikan < ApplicationRecord
  has_many :recipe_mikans, dependent: :destroy
  # belongs_to :recipe_mikan
  has_many_attached :images
end
