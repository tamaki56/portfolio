class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.references :recipe, type: :bigint, foreign_key: true
      # t.string :mikan_name, null: false
      t.string :content, null: false
      t.string :quantity, null: false
      # t.string :amount, null: false
      t.timestamps
    end
  end
end
