class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.boolean :admin, default: false
      t.string :login_token
      t.datetime :login_token_verified_at

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
