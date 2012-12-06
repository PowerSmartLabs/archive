class CreateDatalogs < ActiveRecord::Migration
  def self.up
    create_table :datalogs do |t|
      t.references :server
      t.string :key
      t.string :value
      t.timestamps
    end
    execute "CREATE UNIQUE INDEX datalog_id ON servers(id);"
  end

  def self.down
    drop_table :datalogs
  end
end
