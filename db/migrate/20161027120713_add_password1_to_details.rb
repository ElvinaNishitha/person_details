class AddPassword1ToDetails < ActiveRecord::Migration
  def change
    add_column :details, :password1, :string
  end
end
