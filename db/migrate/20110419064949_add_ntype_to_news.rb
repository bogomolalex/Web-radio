class AddNtypeToNews < ActiveRecord::Migration
  def self.up
  end

  def self.down
    remove_column :news, :ntype
  end
end
