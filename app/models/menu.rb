class Menu < ActiveRecord::Base
  has_many :sub, :class_name=>'Menu',:foreign_key=>'menu_id'
end
