class AddUserWindowshipIdToUerRecords < ActiveRecord::Migration[5.0]
  def change

  	add_column :user_records, :user_windowship_id, :integer
  end
end
