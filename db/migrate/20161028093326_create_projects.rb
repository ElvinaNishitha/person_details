class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.time :duration
      t.integer :teamsize
      t.integer :cost
      t.string :domain
      t.string :users

      t.timestamps null: false
    end
  end
end
