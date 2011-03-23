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

ActiveRecord::Schema.define(:version => 20110217085404) do

  create_table "logs", :force => true do |t|
    t.string "descr"
    t.string "code"
  end

  create_table "programs", :force => true do |t|
    t.datetime "value_date"
    t.string   "title",       :limit => 200
    t.string   "description", :limit => 200
    t.string   "image_url"
  end

  create_table "userprofs", :force => true do |t|
    t.string "username",    :limit => 200
    t.string "password",    :limit => 200
    t.string "description", :limit => 200
  end

end
