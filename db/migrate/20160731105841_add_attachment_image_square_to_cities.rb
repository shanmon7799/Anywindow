class AddAttachmentImageSquareToCities < ActiveRecord::Migration[5.0]
  def change

  add_attachment :cities, :image_square
  end
end
