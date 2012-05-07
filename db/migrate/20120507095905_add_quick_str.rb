class AddQuickStr < ActiveRecord::Migration
  def self.up
   #creating MAIN menu
    m=Menu.new
    m.id=21
    m.mtype='MAIN'
    m.title='Всплывающая строка'
    m.no=21
    m.save
  end

  def self.down
  end
end
