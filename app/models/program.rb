class Program < ActiveRecord::Base
 has_many :news, :class_name=>'New'
 accepts_nested_attributes_for :news
 before_save :default_value_date_if_nil

 cattr_reader :per_page
 @@per_page =5

 validates_presence_of :title,:message=>"Заголовок программы не задан."
 validates_presence_of :description,:message=>"Укажите краткое содержание программы."
 #validates_presence_of :value_date,:message=>"Дата новости не указана."
 validates_length_of :title ,:maximum=>100,:message=>"длина должна быть меньше 100 символов."
# validates_length_of :image_url ,:maximum=>200,:message=>"длина должна быть меньше 200 символов."
 validates_length_of :status_id,:maximum=>3,:message=>"длина должна быть меньше 3 символов."
  
 named_scope :get_curent_program,
 {:conditions=>"value_date>=#{Date.today}"
#  :group=>"id",
#:select=>"id"
 }

 private

  def default_value_date_if_nil 
     self.value_date=DateTime.now  if self.value_date.nil?
  end

end
