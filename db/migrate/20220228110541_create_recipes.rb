class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.bigint :user_id
      t.string :title, null: false
      t.text :description, null: false
      #t.string :image
      # t.references :mikan, foreign_key: true
      t.integer :amount, null: false

      t.timestamps
    end
    add_foreign_key :recipes, :users
  end
end
