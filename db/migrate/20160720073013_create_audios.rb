class CreateAudios < ActiveRecord::Migration[5.0]
  def change
    create_table :audios do |t|

    	t.attachment :audio
      t.integer :window_id, :index => true
      t.timestamps null: false
    end
  end
end
