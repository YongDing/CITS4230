class AddDetailsToPics < ActiveRecord::Migration
  def change
    add_column :pics, :longitude, :decimal
    add_column :pics, :latitude, :decimal
  end
end
