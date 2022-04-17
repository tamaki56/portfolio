class Mikan < ApplicationRecord
  has_many :recipe_mikans, dependent: :destroy
  # belongs_to :recipe_mikan
  has_many_attached :images
  
  validates :mikan_name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :sweetness, presence: true
  validates :season, presence: true
end
