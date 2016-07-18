class AddLocationToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :location, :string
  end
end
