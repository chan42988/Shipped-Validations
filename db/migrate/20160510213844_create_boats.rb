class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :name
      t.integer :max_containers
      t.string :location
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
