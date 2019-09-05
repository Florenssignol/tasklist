class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.boolean :done, default: false
      t.integer :duration, default: 5

      t.timestamps
    end
  end
end
