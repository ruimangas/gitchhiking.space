class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :email
      t.string :name
      t.string :starred
      t.string :nickname

      t.timestamps
    end
  end
end
