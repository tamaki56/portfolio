class Recipe < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  belongs_to :recipe_tag
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
