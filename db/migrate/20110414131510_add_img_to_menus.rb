class AddImgToMenus < ActiveRecord::Migration
  def self.up
  create_table "menus", :force => true do |t|
    t.string  "mtype",   :limit => 20,  :default => "", :null => false
    t.string  "title",   :limit => 100
    t.string  "descr",   :limit => 100
    t.integer "no"
    t.integer "menu_id"
    t.string  "img"
  end

#    add_column :menus, :img, :string
  end

  def self.down
    remove_column :menus, :img
  end
end
