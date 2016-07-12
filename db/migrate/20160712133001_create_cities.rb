class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|

      t.string :name
      t.integer :country_id, index: true
      t.timestamps
    end
  end

  add_column :windows, :city_id, :integer, index: true
end
