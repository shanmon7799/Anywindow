class ChangeColumnToUserWindowships < ActiveRecord::Migration[5.0]
  def change

  	change_column :user_windowships, :is_broken, :boolean, default: false, null: false
  end
end
