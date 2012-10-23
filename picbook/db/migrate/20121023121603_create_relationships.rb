class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :person_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
