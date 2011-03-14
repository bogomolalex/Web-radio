class Updprogurl1 < ActiveRecord::Migration

  def self.up
   Program.find(:all).each  do |t|
    t.image_url=""
    t.save
   end
  end

  def self.down
  end
end
