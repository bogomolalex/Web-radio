class Menu < ActiveRecord::Base
  has_many :mlist, :class_name=>'Menu',:foreign_key=>'menu_id',:order=>"no"

end
