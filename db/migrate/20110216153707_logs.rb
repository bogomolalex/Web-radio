class Logs < ActiveRecord::Migration

  def self.up
   create_table "logs", :force => true do |t|
     t.string "descr"
     t.string "code"
   end
  end

  def self.down
   drop_table :logs
  end
end
