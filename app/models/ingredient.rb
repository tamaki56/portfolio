class Ingredient < ApplicationRecord
    belongs_to :recipe
    
    validates :content, presence: true #空でないように設定
    validates :quantity, presence: true #空でないように設定
end
