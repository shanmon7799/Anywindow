class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|

      t.attachment :video
      t.integer :window_id, :index => true
      t.timestamps null: false
    end
  end
end
