class AddPasswordSaltToDetails < ActiveRecord::Migration
  def change
    add_column :details, :password_salt, :string
  end
end
