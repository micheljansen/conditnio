class CreateSightings < ActiveRecord::Migration
  def up
    create_table :sightings do |t|
      t.string :token
      t.timestamps
    end
  end

  def down
    drop_table :sightings
  end
end
