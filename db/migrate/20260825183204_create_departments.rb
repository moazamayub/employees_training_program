class CreateDepartments < ActiveRecord::Migration[8.1]
  def change
    create_table :departments do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
