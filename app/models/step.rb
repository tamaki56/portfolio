class Step < ApplicationRecord
   belongs_to :recipe
   has_many_attached :images
   
   validates :direction, presence: true #空でないように設定
end
