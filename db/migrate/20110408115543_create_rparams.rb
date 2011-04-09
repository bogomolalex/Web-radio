class CreateXparams < ActiveRecord::Migration

  def self.up
    create_table :xparams do |t|
      t.string   "name",     :limit => 20,   :null => false
      t.string   "ptype",    :limit => 20,   :null => false
      t.string   "value_str",:limit => 250
      t.date     "value_date"
      t.integer  "value_num"
      t.datetime "inserted" ,  :null => false
      t.string   "inserted_by",:limit=>30,   :null => false
      t.datetime "updated"
      t.string   "updated_by", :limit=>30,   :null => false
    end
  end

  def self.down
    drop_table :rparams
  end

end
