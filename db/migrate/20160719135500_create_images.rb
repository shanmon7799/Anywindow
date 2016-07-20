class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|

      t.attachment :image
      t.integer :window_id, :index => true

      t.timestamps
    end
  end
end
