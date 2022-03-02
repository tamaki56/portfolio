class AddGenreToRecipe < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :genre, :integer, null: false
  end
end
