class My < ActiveRecord::Migration
  def self.up
    add_column :logs, :code1, :string
  end

  def self.down
    remove_column :logs, :code1
  end
end
