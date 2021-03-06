class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :user,  foreign_key: true, null: false
      t.references :report,  foreign_key: true, null: false
      t.text :text
      t.timestamps
    end
  end
end
