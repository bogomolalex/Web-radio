class AddValueNumToXparams < ActiveRecord::Migration
  def self.up
    add_column :xparams, :value_num, :integer
  end

  def self.down
    remove_column :xparams, :value_num
  end
end
