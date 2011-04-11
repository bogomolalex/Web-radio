class Xparam < ActiveRecord::Base
  # обязательные поля
  validates_presence_of :inserted,:inserted_by,:name,:ptype
   # Значения по умолчанию
  before_save :set_default_values

  private
   def set_default_values
    
    self.updated_by='USER' if self.updated_by.blank? 
    
    self.updated=DateTime.now if self.updated.nil? 
    
  end
  
end
