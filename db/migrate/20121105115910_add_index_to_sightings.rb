class AddIndexToSightings < ActiveRecord::Migration
  def up
    add_index :sightings, :token
  end

  def down
    remove_index :sightings, :token
  end
end
