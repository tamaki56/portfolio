class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.references :recipe, foreign_key: true
      t.integer :number, null: false
      t.string :step_image
      t.text :direction, null: false
      t.timestamps
    end
  end
end
