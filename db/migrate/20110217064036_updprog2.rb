class Updprog2 < ActiveRecord::Migration
  def self.up
   @i=0
   Program.find(:all).each  do |t|
    t.title="#{@i}"+t.title.upcase
    @i+=1
    t.save
   end
  end

  def self.down
  end
end
