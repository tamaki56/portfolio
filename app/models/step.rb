class Step < ApplicationRecord
   belongs_to :recipe
   has_many_attached :images
end
