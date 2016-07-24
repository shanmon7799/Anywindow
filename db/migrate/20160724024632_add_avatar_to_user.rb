class AddAvatarToUser < ActiveRecord::Migration[5.0]
  def change
    add_attachment :users, :avatar

    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :full_name
  end
end
