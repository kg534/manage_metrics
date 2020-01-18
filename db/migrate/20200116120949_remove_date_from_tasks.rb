class RemoveDateFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :start_time, :datetime
    add_column :tasks, :end_time, :datetime
  end
end
