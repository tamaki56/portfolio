class CreateRecipeTags < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_tags do |t|
      t.references :recipe, type: :bigint, foreign_key: true
      t.references :tag, type: :bigint, foreign_key: true
      t.timestamps
    end
  end
end
