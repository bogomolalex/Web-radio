class FillMenuData < ActiveRecord::Migration
  def self.up
   m=Menu.find_all_by_id([4,5,6,7,8,9,10,11,12,13]).each do |t|
     t.destroy
   end
   #creating Admin menu menu
    m=Menu.new
    m.id=4
    m.mtype='ADMNOW'
    m.title='Сегодня'
    m.no=1
    m.save
    m=Menu.new
    m.id=5
    m.mtype='ADMARC'
    m.title='Архив'
    m.no=2
    m.save
    m=Menu.new
    m.id=6
    m.mtype='ADMSYS'
    m.title='Система'
    m.no=3
    m.save
   #creating ADMNOW menu menu
      m=Menu.new              
      m.id=7                  
      m.mtype='LIST'          
      m.title='Передачи'
      m.no=1                  
      m.menu_id=4             
      m.img="rails.png"       
      m.save                  
      m=Menu.new              
      m.id=9                  
      m.mtype='NEWACT'        
      m.title='Активизировать новость'
      m.no=2                  
      m.menu_id=4             
      m.save                  
      m=Menu.new              
      m.id=10                 
      m.mtype='NEW'           
      m.title='Новости (создать/удалить)'
      m.no=3                  
      m.menu_id=4             
      m.save                  
      m=Menu.new              
      m.id=11                 
      m.mtype='TOMW'          
      m.title='Передачи на завтра'
      m.no=4                  
      m.menu_id=4             
      m.save                  
   #creating ADMARC menu menu
      m=Menu.new              
      m.id=12
      m.mtype='ARCNEWS'          
      m.title='Новости'
      m.no=4                  
      m.menu_id=5             
      m.save                  
      m=Menu.new              
      m.id=13
      m.mtype='ARCLIST'          
      m.title='Передачи на дату'
      m.no=4                  
      m.menu_id=5
      m.save                  
   #creating ADMSYS menu menu
      m=Menu.new              
      m.id=14
      m.mtype='ADMTUNE'          
      m.title='Настройка'
      m.no=4                  
      m.menu_id=6
      m.save                  
  end
  
  def self.down
  end
end
