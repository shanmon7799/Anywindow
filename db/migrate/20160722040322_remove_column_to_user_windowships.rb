class RemoveColumnToUserWindowships < ActiveRecord::Migration[5.0]
  def change

  	remove_column :user_windowships, :is_broken
  end
end
