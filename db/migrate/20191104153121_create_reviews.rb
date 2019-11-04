class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :booking, foreign_key: true
      t.text :sucker_content
      t.integer :sucker_rating
      t.text :beast_content
      t.integer :beast_rating

      t.timestamps
    end
  end
end
