class AddingXparams2 < ActiveRecord::Migration
  def self.up
   p=Xparam.new
   p.id=1
   p.name='title'
   p.descr='Заголовок сайта'
   p.ptype='SYS'
   p.value_str='Доброе радио'
   p.inserted=DateTime.now
   p.inserted_by='ADMIN'
   p.updated_by='ADMIN'
   p.save
   p=Xparam.new
   p.id=2
   p.name='per_page'
   p.descr='Количество строк на странице'
   p.ptype='SYS'
   p.value_num=50
   p.inserted=DateTime.now
   p.inserted_by='ADMIN'
   p.updated_by='ADMIN'
   p.save
   p=Xparam.new
   p.id=3
   p.name='title'
   p.descr='Заголовок програм'
   p.ptype='ProgramController'
   p.value_str="Работа с программами"
   p.inserted=DateTime.now
   p.inserted_by='ADMIN'
   p.updated_by='ADMIN'
   p.save
  end

  def self.down
  end
end
