class AddingTodayMenu < ActiveRecord::Migration
  def self.up
   m=Menu.find_all_by_id([15]).each do |t|
     t.destroy
   end
   #creating ADMNOW menu
    m=Menu.new
    m.id=15
    m.mtype='PRGACT'
    m.title='Выбор текущей передачи'
    m.no=1
    m.menu_id=4
    m.save
    #updating LIST title
    m=Menu.find_by_id([7])
    m.title ="Передачи (создать/изменить)"
    m.save
  end

  def self.down
   m=Menu.find_all_by_id([15]).each do |t|
     t.destroy
   end
  end
end
