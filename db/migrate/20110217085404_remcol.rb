class Remcol < ActiveRecord::Migration
  def self.up
    remove_column :logs, :code1
  end

  def self.down
  end
end
