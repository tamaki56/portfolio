class CreateRecipeMikans < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_mikans do |t|
      t.references :recipe, type: :bigint, foreign_key: true
      t.references :mikan,  foreign_key: true
      t.integer :amount, null: false
      
      t.timestamps
    end
  end
end
