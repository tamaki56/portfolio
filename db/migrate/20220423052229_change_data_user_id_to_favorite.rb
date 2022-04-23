class ChangeDataUserIdToFavorite < ActiveRecord::Migration[6.1]
  def change
    change_column :favorites, :user_id, :bigint
    change_column :favorites, :recipe_id, :bigint
    change_column :ingredients, :recipe_id, :bigint
    change_column :recipe_mikans, :recipe_id, :bigint
    change_column :recipe_mikans, :mikan_id, :bigint
    change_column :recipe_tags, :recipe_id, :bigint
    change_column :recipe_tags, :tag_id, :bigint
    change_column :recipes, :user_id, :bigint
    change_column :steps, :recipe_id, :bigint
  end
end
