class CreateClusters < ActiveRecord::Migration
  def self.up
    create_table :clusters do |t|
      t.string :name
      t.references :type
    end
    execute "CREATE UNIQUE INDEX cluster_id ON clusters(id);"
  end

  def self.down
    drop_table :clusters
  end
end
