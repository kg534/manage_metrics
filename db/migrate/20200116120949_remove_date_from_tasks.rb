class RemoveDateFromTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :end_time, :datetime;
    add_column :tasks, :complete, :boolean, default: false
  end
end
