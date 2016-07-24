class AddCoordinatesToCitiesAndWindows < ActiveRecord::Migration[5.0]
  def change

    add_column :windows, :latitude, :string
    add_column :windows, :longitude, :string
    remove_column :windows, :location

    add_column :cities, :latitude, :string
    add_column :cities, :longitude, :string

  end
end
