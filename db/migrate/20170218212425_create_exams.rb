class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :owner_id, null: false
      t.string :title, null: false
      t.string :description
      t.integer :root_question_id, null: false
      t.timestamps null: false
    end
    add_index :exams, :owner_id
    add_index :exams, :root_question_id
  end
end
