class CreateUserQuizes < ActiveRecord::Migration[8.1]
  def change
    create_table :user_quizes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.decimal :score

      t.timestamps
    end
  end
end
