class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
    end
    execute "CREATE UNIQUE INDEX location_id on locations(id);"
  end

  def self.down
    drop_table :locations
  end
end
