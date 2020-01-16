class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.date :start
      t.date :end
      t.timestamps
    end
  end
end
