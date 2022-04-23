class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.bigint :user_id
      t.bigint :recipe_id
      # t.references :user, type: :bigint, foreign_key: true
      # t.references :recipe, type: :bigint, foreign_key: true
      t.timestamps
    end
    add_foreign_key :favorites, :users
    add_foreign_key :favorites, :recipes
  end
end
