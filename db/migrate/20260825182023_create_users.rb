class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      # t.references :company, null: false, foreign_key: true
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.integer :role
      t.integer :status

      t.timestamps
    end
  end
end
