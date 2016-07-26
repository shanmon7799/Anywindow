class AddEnNameToCountryAndCity < ActiveRecord::Migration[5.0]
  def change

  	add_column :countries, :en_name, :string

  	add_column :cities, :en_name, :string
  end
end
