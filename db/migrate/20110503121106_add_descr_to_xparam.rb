class AddDescrToXparam < ActiveRecord::Migration
  def self.up
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
    t.string   "descr",       :limit => 50
  end

#    add_column :xparams, :descr, :string,:limit=>50
  end

  def self.down
    remove_column :xparams, :descr
  end
end
