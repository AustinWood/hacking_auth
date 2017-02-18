class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.integer :user_id
      t.string :stop_time

      t.timestamps null: false
    end
  end
end
