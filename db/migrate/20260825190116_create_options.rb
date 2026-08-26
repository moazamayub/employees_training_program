class CreateOptions < ActiveRecord::Migration[8.1]
  def change
    create_table :options do |t|
      t.references :slide_question, null: false, foreign_key: true
      t.text :option_text
      t.boolean :correct
      t.text :explanation

      t.timestamps
    end
  end
end
