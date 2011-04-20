class AddStatusToNews < ActiveRecord::Migration
  def self.up
    add_column :news, :status, :string,:limit=>3, :default=>"NEW",:null=>false
  end

  def self.down
    remove_column :news, :status
  end
end
