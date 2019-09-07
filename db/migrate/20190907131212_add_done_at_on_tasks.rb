class AddDoneAtOnTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :done_at, :datetime
  end
end
