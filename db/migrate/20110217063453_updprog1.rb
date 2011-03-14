class Updprog1 < ActiveRecord::Migration
  def self.up
   Program.find(:all).each  do |t|
    t.update_attribute :title, t.title.upcase
    t.save
   end
  end

  def self.down
   Program.find(:all).each do |t| 
    t.update_attribute :title, t.title.downcase
    t.save
   end
  end
end
