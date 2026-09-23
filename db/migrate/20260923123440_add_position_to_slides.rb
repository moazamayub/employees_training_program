class AddPositionToSlides < ActiveRecord::Migration[8.1]
  def change
    add_column :slides, :position, :integer, default: 0, null: false
  end
end
