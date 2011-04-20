class AddNtypeToNews < ActiveRecord::Migration
  def self.up
    add_column :news, :ntype, :string,:limit=>20, :default=>"NEWS",:null=>false
  end

  def self.down
    remove_column :news, :ntype
  end
end
