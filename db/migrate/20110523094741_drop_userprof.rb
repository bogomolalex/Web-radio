class DropUserprof < ActiveRecord::Migration
  def self.up
    drop_table "userprofs"
  end

  def self.down
  end
end
