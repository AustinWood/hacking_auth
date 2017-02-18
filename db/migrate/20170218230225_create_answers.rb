class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :attempt_id
      t.boolean :is_open
      t.boolean :did_open

      t.timestamps null: false
    end
  end
end
