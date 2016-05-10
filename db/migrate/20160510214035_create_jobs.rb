class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :containers_needed
      t.string :cargo
      t.string :origin
      t.string :destination
      t.decimal :cost
      t.integer :boat_id
      t.integer :user_id
      t.string :name

      t.timestamps null: false
    end
  end
end
