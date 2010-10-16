class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :day_id
      t.integer :hour
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
