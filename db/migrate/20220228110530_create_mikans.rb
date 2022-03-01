class CreateMikans < ActiveRecord::Migration[6.1]
  def change
    create_table :mikans do |t|
      t.string :mikan_name, null: false,  unique: true
      t.text :introduction, null: false
      t.string :mikan_image
      t.string :mikan_sub_image
      t.integer :price, null: false
      t.text :sweetness, null: false
      t.text :season, null: false
      t.text :tip_title
      t.text :tip
      t.string :tip_image
      t.timestamps
    end
  end
end
