class CreateNews < ActiveRecord::Migration

  def self.up
#    create_table :news do |t|
#     t.string  "title",      :limit => 80, :null => false
#     t.string  "img_url",    :limit => 250
#     t.date    "value_date", :null => false
#     t.integer "no"
#     t.integer "menu_id"
#     t.integer "program_id"
#     t.text    "descr"
#    end
  create_table "programs", :force => true do |t|
    t.string   "title",       :limit => 100, :default => "",    :null => false
    t.text     "description",                                   :null => false
    t.string   "image_url",   :limit => 200, :default => "",    :null => false
    t.datetime "value_date",                                    :null => false
    t.string   "status_id",   :limit => 3,   :default => "NEW"
  end

#    add_index(:news, :value_date)
#    add_index(:news, :menu_id)
#    add_index(:news, :program_id)
    add_index(:programs, :value_date)
    add_index(:menus, :mtype)
  end

  def self.down
    drop_table :news
  end
end
