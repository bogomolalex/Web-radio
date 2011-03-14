class Logs < ActiveRecord::Migration

  def self.up
   add_column :logs,:code,:string
  end

  def self.down
   drop_table :logs
  end
end
