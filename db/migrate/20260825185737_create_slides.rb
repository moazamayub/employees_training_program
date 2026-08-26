class CreateSlides < ActiveRecord::Migration[8.1]
  def change
    create_table :slides do |t|
      t.references :quiz, null: false, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
