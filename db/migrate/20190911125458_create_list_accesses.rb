class CreateListAccesses < ActiveRecord::Migration[5.2]
  def change
    create_table :list_accesses do |t|
      t.references :list, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
