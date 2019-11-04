class CreateBeasts < ActiveRecord::Migration[5.2]
  def change
    create_table :beasts do |t|
      t.references :sucker, foreign_key: true
      t.references :type, foreign_key: true
      t.string :name
      t.string :region
      t.text :description

      t.timestamps
    end
  end
end
