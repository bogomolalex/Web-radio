class Program < ActiveRecord::Base

 cattr_reader :per_page
 @@per_page =5

 has_many :news, :class_name=>'New'

 accepts_nested_attributes_for :news

 before_save :default_value_date_if_nil

 validates_presence_of :title
  
 named_scope :get_curent_program,
 {:conditions=>"value_date>=#{Date.today}"
#  :group=>"id",
#:select=>"id"
 }

 private

  def default_value_date_if_nil 
     self.value_date=DateTime.now if self.value_date.nil?
  end

end
