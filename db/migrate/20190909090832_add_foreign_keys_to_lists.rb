class AddForeignKeysToLists < ActiveRecord::Migration[5.2]
  def change
    add_reference :lists, :user, index:true, foreign_key: true
    add_reference :tasks, :list, index:true, foreign_key: true
  end
end
