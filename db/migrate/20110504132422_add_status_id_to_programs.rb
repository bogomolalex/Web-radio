class AddStatusIdToPrograms < ActiveRecord::Migration
  def self.up
#    add_column :programs, :status_id, :string,:limit=>3,:default=>'NEW'
  end

  def self.down
    remove_column :programs, :status_id
  end
end
