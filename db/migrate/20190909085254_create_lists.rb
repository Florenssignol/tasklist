class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.text :description
      t.integer :percentage_done, default: 0
      t.timestamps
    end
  end
end
