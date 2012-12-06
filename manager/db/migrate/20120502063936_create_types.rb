class CreateTypes < ActiveRecord::Migration
  def self.up
    create_table :types do |t|
      t.string :name
    end
    execute "CREATE UNIQUE INDEX type_id on types(id);"
  end

  def self.down
    drop_tables :types
  end
end
