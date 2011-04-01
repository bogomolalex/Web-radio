class Program < ActiveRecord::Base

 before_save :default_value_date_if_nil

 validates_presence_of :title

 private

  def default_value_date_if_nil 

    if self.value_date.nil?
     self.value_date=DateTime.now
    end

  end

end
