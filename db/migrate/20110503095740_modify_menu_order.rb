class ModifyMenuOrder < ActiveRecord::Migration
  def self.up
   m=Menu.find_by_id(9)
   m.no=4
   m.save
   m=Menu.find_by_id(10)
   m.no=3
   m.save
   m=Menu.find_by_id(11)
   m.no=2
   m.save
  end

  def self.down
  end
end
