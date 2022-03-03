class Tag < ApplicationRecord
   #belongs_to :recipe_tag
   
  # tag_mapsと関連付けを行い、recipe_tagsのテーブルを通しrecipesテーブルと関連づけ
  #   dependent: :destroyをつけることで、タグが削除された時にタグの関連付けを削除する
  has_many :recipe_tags, dependent: :destroy, foreign_key: 'tag_id'  
  
  # postsのアソシエーション
  #   Tag.recipesとすれば、タグに紐付けられたRecipeを取得可能になる
  has_many :recipes, through: :recipe_tags  
end
