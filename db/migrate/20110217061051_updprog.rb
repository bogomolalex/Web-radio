class Updprog < ActiveRecord::Migration

  def self.up
   Program.find(:all).each  do |t|
    t.title=t.title.upcase
    t.save
   end
  end

  def self.down
   Program.find(:all).each do |t| 
    t.title=t.title.downcase
    t.save
   end
  end

end
