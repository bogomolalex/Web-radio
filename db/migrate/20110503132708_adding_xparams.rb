class AddingXparams < ActiveRecord::Migration
  def self.up
   Xparam.find_all_by_id([1,2,3]).each do |f|
     f.destroy
   end
  end

  def self.down
  end
end
