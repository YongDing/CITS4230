class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :gender
      t.timedate :birthday
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
