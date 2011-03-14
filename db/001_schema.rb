class Logs < ActiveRecord::Migration

  def self.up
  create_table "logs", :force => true do |t|
    t.string "descr"
    t.string "code"
  end

  create_table "menus", :force => true do |t|
    t.string  "mtype",    :limit => 20,  :default => "", :null => false
    t.string  "title",   :limit => 100
    t.string  "descr",   :limit => 100
    t.integer "no"
    t.integer "menu_id"
  end

  create_table "programs", :force => true do |t|
    t.string   "title",       :limit => 100, :default => "", :null => false
    t.text     "description",                                :null => false
    t.string   "image_url",   :limit => 200, :default => "", :null => false
    t.datetime "value_date",                                 :null => false
  end

  create_table "userprofs", :force => true do |t|
    t.string "username", :limit => 20
    t.string "password", :limit => 20
    t.string "role",     :limit => 20
    t.text   "name"
    t.string "status",   :limit => 20
  end
  end

  def self.down
   drop_table :logs
   drop_table "menus"
   drop_table "programs"
   drop_table "userprofs"
  end

end
