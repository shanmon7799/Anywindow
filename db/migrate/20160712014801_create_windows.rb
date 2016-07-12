class CreateWindows < ActiveRecord::Migration[5.0]
  def change
    create_table :windows do |t|

      t.string :name
      t.string :location
      t.integer :page_views, default: 0, null: false

      t.timestamps
    end
  end
end
