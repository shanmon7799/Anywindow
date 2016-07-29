class AddColumnDescriptionAndPhotoToCities < ActiveRecord::Migration[5.0]
  def change

  	add_column :cities, :description, :text
  	add_attachment :cities, :image
  end
end
