class CreateSlideQuestions < ActiveRecord::Migration[8.1]
  def change
    create_table :slide_questions do |t|
      t.references :slide, null: false, foreign_key: true
      t.text :question_text
      t.integer :question_type
      t.integer :points

      t.timestamps
    end
  end
end
