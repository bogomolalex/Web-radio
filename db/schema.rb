# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110419064949) do

  create_table "logs", :force => true do |t|
    t.string "descr"
    t.string "code"
  end

  create_table "menus", :force => true do |t|
    t.string  "mtype",   :limit => 20,  :default => "", :null => false
    t.string  "title",   :limit => 100
    t.string  "descr",   :limit => 100
    t.integer "no"
    t.integer "menu_id"
    t.string  "img"
  end

  add_index "menus", ["mtype"], :name => "index_menus_on_mtype"

  create_table "news", :force => true do |t|
    t.string  "title",      :limit => 80,  :default => "",     :null => false
    t.string  "img_url",    :limit => 250
    t.date    "value_date",                                    :null => false
    t.integer "no"
    t.integer "menu_id"
    t.integer "program_id"
    t.text    "descr"
    t.string  "status",     :limit => 3,   :default => "NEW",  :null => false
    t.string  "ntype",      :limit => 20,  :default => "NEWS", :null => false
  end

  add_index "news", ["menu_id"], :name => "index_news_on_menu_id"
  add_index "news", ["program_id"], :name => "index_news_on_program_id"
  add_index "news", ["value_date"], :name => "index_news_on_value_date"

  create_table "programs", :force => true do |t|
    t.string   "title",       :limit => 100, :default => "", :null => false
    t.text     "description",                                :null => false
    t.string   "image_url",   :limit => 200, :default => "", :null => false
    t.datetime "value_date",                                 :null => false
  end

  add_index "programs", ["value_date"], :name => "index_programs_on_value_date"

  create_table "userprofs", :force => true do |t|
    t.string "username", :limit => 20
    t.string "password", :limit => 20
    t.string "role",     :limit => 20
    t.text   "name"
    t.string "status",   :limit => 20
  end

  create_table "xparams", :force => true do |t|
    t.string   "name",        :limit => 20,  :default => "", :null => false
    t.string   "ptype",       :limit => 20,  :default => "", :null => false
    t.string   "value_str",   :limit => 250
    t.date     "value_date"
    t.integer  "value_num"
    t.datetime "inserted",                                   :null => false
    t.string   "inserted_by", :limit => 30,  :default => "", :null => false
    t.datetime "updated"
    t.string   "updated_by",  :limit => 30,  :default => "", :null => false
  end

end
