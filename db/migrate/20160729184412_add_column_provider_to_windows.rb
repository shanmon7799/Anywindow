class AddColumnProviderToWindows < ActiveRecord::Migration[5.0]
  def change

  	add_column :windows, :provider_name, :string
  	add_column :windows, :provider_service, :string
  	add_column :windows, :provider_url, :string
  	add_attachment :windows, :provider_pic
  end
end
