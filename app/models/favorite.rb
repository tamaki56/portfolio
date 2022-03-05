class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :recipe
    
    validates_uniqueness_of :recipe_id, scope: :user_id # 同じ投稿を複数回お気に入り登録させない

end
