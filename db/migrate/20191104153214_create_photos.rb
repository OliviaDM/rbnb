class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :beast, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
