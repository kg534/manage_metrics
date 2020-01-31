class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.date :active_date, null: false
      t.integer :order, null: false
      t.integer :phone, null: false
      t.integer :visit, null: false
      t.integer :negotiate, null: false
      t.text :good_thing
      t.text :problem
      t.text :goal
      t.timestamps
      t.references :user,  foreign_key: true, null: false, index: true
    end
  end
end
