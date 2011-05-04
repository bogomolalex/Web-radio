class AddDescrToXparam < ActiveRecord::Migration
  def self.up
    add_column :xparams, :descr, :string,:limit=>50
  end

  def self.down
    remove_column :xparams, :descr
  end
end
