class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :title
      t.binary :image
      t.boolean :prop
      t.references :account

      t.timestamps
    end
    add_index :pics, :account_id
  end
end
