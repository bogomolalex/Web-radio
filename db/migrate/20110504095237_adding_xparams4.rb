class AddingXparams4 < ActiveRecord::Migration
  def self.up
   p=Xparam.new
   p.id=4
   p.name='prog_act'
   p.descr='Активизация программ вручную'
   p.ptype='SYS'
   p.value_str='Y'
   p.inserted=DateTime.now
   p.inserted_by='ADMIN'
   p.updated_by='ADMIN'
   p.save
  end

  def self.down
  end
end
