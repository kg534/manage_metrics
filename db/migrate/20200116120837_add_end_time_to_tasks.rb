class AddEndTimeToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :end_time, :datetime
  end
end
