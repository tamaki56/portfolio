class AddAmountToMikan < ActiveRecord::Migration[6.1]
  def change
    add_column :mikans, :amount, :string
  end
end
