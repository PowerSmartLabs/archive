class CreateDatacenters < ActiveRecord::Migration
  def self.up
    create_table :datacenters do |t|
      t.string :name
      t.references :location
    end
    execute "CREATE UNIQUE INDEX datacenter_id ON datacenters(id);"
  end

  def self.down
    drop_table :datacenters
  end
end
