class AddCodeToLogs < ActiveRecord::Migration
  def self.up
    add_column :logs, :code, :string
  end

  def self.down
    remove_column :logs, :code
  end
end
