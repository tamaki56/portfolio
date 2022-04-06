class RecipeMikan < ApplicationRecord
  belongs_to :mikan
  belongs_to :recipe
  
  validates :amount, presence: true #空でないように設定
end
