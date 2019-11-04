class CreateSuckers < ActiveRecord::Migration[5.2]
  def change
    create_table :suckers do |t|
      t.string :user_name
      t.string :password
      t.string :name
      t.string :email
      t.string :phone
      t.string :avatar

      t.timestamps
    end
  end
end
