class FillMenuLogData < ActiveRecord::Migration
  def self.up
       #creating ADMSYS menu menu
      m=Menu.new
      m.id=20
      m.mtype='ADMLOG'
      m.title='Аудит системы'
      m.no=4
      m.menu_id=6
      m.save
  end

  def self.down
  end
end
