class AddColumnToWindowAndCity < ActiveRecord::Migration[5.0]
  def change
    add_column :windows, :locations, :string

    add_column :quotes, :author, :string
  end
end
