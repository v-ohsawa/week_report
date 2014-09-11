class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :worker_id
      t.string :name
      t.string :password_digest
      t.string :remember_token
      t.boolean :admin

      t.timestamps
    end
  end
end
