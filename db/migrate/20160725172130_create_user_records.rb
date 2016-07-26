class CreateUserRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :user_records do |t|

    	t.boolean :is_broken, default: false
      t.timestamps
    end
  end
end
