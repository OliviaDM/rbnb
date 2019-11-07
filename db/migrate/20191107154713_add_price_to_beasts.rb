class AddPriceToBeasts < ActiveRecord::Migration[5.2]
  def change
    add_column :beasts, :price, :float
  end
end
