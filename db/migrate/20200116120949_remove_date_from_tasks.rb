class RemoveDateFromTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :complete, :boolean, default: false
    remove_column :tasks, :end_time, :datetime
    remove_column :tasks, :end, :date
    remove_column :tasks, :start, :date
  end
end
