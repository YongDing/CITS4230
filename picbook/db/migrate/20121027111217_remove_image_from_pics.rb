class RemoveImageFromPics < ActiveRecord::Migration
  def up
    remove_column :pics, :image
  end

  def down
    add_column :pics, :image, :blob
  end
end
