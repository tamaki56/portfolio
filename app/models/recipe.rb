class Recipe < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :mikans, dependent: :destroy
  accepts_nested_attributes_for :ingredients, allow_destroy: true
  accepts_nested_attributes_for :steps, allow_destroy: true
  accepts_nested_attributes_for :mikans, allow_destroy: true
  belongs_to :recipe_tag
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
