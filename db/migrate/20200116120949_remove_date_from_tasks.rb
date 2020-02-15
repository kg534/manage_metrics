class RemoveDateFromTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :complete, :boolean, default: false
  end
end
