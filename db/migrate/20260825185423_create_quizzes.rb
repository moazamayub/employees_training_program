class CreateQuizzes < ActiveRecord::Migration[8.1]
  def change
    create_table :quizzes do |t|
      t.references :course, null: false, foreign_key: true
      t.string :title
      t.decimal :passing_score

      t.timestamps
    end
  end
end
