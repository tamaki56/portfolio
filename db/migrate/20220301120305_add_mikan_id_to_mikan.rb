class AddMikanIdToMikan < ActiveRecord::Migration[6.1]
  def change
    add_column :mikans, :recipe_id, :integer
  end
end
