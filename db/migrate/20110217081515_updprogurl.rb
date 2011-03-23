class Updprogurl < ActiveRecord::Migration
  def self.up
    add_column :programs, :image_url, :string

   Program.find(:all).each  do |t|
    t.image_url="n/a"
    t.save
   end

  end

  def self.down
  end
end
