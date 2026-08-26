class CreateUserCourses < ActiveRecord::Migration[8.1]
  def change
    create_table :user_courses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.decimal :score
      t.integer :status
      t.decimal :progress_percentage
      t.datetime :enrolled_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
