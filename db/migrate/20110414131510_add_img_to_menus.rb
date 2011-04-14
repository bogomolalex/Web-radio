class AddImgToMenus < ActiveRecord::Migration
  def self.up
    add_column :menus, :img, :string
  end

  def self.down
    remove_column :menus, :img
  end
end
