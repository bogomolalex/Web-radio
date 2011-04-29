class FillData < ActiveRecord::Migration
  def self.up
   m=Menu.find_all_by_id([1,2,3]).each do |t|
     t.destroy
   end
   #creating MAIN menu
    m=Menu.new
    m.id=1
    m.mtype='MAIN'
    m.title='Главная'
    m.no=1
    m.save
    m=Menu.new
    m.id=2
    m.mtype='MAIN'
    m.title='On-лайн радио'
    m.no=2
    m.save
    m=Menu.new
    m.id=3
    m.mtype='MAIN'
    m.title='О нас'
    m.no=3
    m.save
  end

  def self.down
  end
end
