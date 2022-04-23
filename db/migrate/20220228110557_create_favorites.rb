class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.bigint :user_id
      t.references :recipe, type: :bigint, foreign_key: true
      t.timestamps
    end
    add_foreign_key :favorites, :users
  end
end
