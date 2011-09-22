class CreateLoggs < ActiveRecord::Migration
  def self.up
    create_table :loggs do |t|
      t.string  "username",   :limit => 80, :null => false
      t.string  "event",      :limit => 80, :null => false
      t.string  "message",    :limit => 250
      t.date    "logg_date", :null => false
      t.timestamps
    end
    add_index :loggs, :logg_date, :unique => false
  end

  def self.down
    drop_table :loggs
  end
end
