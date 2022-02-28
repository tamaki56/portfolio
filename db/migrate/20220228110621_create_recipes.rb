class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false
      t.string :image
      
      t.timestamps
    end
  end
end
