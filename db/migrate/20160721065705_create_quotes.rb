class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|

    	t.string :content
      t.timestamps null: false
    end
  end
end
