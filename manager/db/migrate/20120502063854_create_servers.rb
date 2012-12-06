class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers do |t|
      t.string :name
      t.string :ipaddress
      t.string :model
      t.references :cluster
    end
    execute "CREATE UNIQUE INDEX server_id ON servers(id);"
  end

  def self.down
    drop_table :servers
  end
end
