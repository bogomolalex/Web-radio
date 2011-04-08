class Program < ActiveRecord::Base

 before_save :default_value_date_if_nil

 validates_presence_of :title
  
 named_scope :get_curent_program,
 {:conditions=>"value_date>=#{Date.today}"
#  :group=>"id",
#:select=>"id"
 }

 private

  def default_value_date_if_nil 

    if self.value_date.nil?
     self.value_date=DateTime.now
    end

  end

end
