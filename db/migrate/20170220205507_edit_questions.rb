class EditQuestions < ActiveRecord::Migration
  def change
    drop_table :questions
    create_table :questions do |t|
      t.integer :parent_id
      t.string :text
      t.boolean :is_open
      t.boolean :did_open
      t.timestamps null: false
    end
  end
end
