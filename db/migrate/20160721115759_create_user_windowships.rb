class CreateUserWindowships < ActiveRecord::Migration[5.0]
  def change
    create_table :user_windowships do |t|

    	t.boolean :is_broken
    	t.integer :user_id, :index => true
    	t.integer :window_id, :index => true
      t.timestamps
    end
  end
end
