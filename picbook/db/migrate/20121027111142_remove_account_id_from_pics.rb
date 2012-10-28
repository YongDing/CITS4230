class RemoveAccountIdFromPics < ActiveRecord::Migration
  def up
    remove_column :pics, :account_id
  end

  def down
    add_column :pics, :account_id, :integer
  end
end
