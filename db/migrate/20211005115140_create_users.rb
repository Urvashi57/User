class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :username
      t.text :password
      t.text :password_confirmation
      t.text :email
      t.timestamps
    end
  end
end
