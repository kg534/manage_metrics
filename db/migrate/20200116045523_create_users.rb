class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, unique: true, index: true
      t.string :email, null: false, nuique: true
      t.string :password_digest, null: false
      t.timestamps
    end
  end
end