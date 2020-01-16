class AddUserIdToTasks < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :user, null: false, index: true
  end
end
