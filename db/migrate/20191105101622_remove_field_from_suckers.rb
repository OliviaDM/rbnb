class RemoveFieldFromSuckers < ActiveRecord::Migration[5.2]
  def change
    remove_column :suckers, :email, :string
    remove_column :suckers, :password, :string
  end
end
