class AddStatusToNews < ActiveRecord::Migration
  def self.up
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
  end

  def self.down
    remove_column :news, :status
  end
end
