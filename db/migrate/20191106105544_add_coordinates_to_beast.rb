class AddCoordinatesToBeast < ActiveRecord::Migration[5.2]
  def change
    add_column :beasts, :latitude, :float
    add_column :beasts, :longitude, :float
  end
end
