class AddEmailToNivers < ActiveRecord::Migration[7.0]
  def change
    add_column :nivers, :email, :string   
  end
end
