
class New < ActiveRecord::Base
 cattr_reader :per_page
 @@per_page =5

 belongs_to :program
 belongs_to :menu

 #Проверки всякие
 validates_presence_of :title,:message=>"Заголовок не заполнен."
 validates_presence_of :value_date,:status,:ntype,:message=>"Дата новости не указана."
 validates_presence_of :status,:ntype,:message=>"Статус не заполнен."
 validates_presence_of :ntype,:message=>"Тип ноаости не указан."
 validates_length_of :title ,:maximum=>80,:message=>"длина должна быть меньше 80 символов."
 validates_length_of :img_url ,:maximum=>250,:message=>"длина должна быть меньше 250 символов."
 validates_length_of :status ,:maximum=>3,:message=>"длина должна быть меньше 3 символов."
 validates_length_of :ntype ,:maximum=>20,:message=>"длина должна быть меньше 20 символов."
 validates_numericality_of :no,:menu_id, :integer_only => true,:message=>"Значение поля должно быть числовым."
 #validates_date :value_date,:message=>"Должен быть использован формат даты ДД.ММ.ГГГГ"

 

 def short_descr
    (descr||'xxx').first(80)+"..."
 end
 def menu_title
   m=Menu.find_by_id(menu_id)
   unless m.nil?
    m.title     
   end
 end

 def self.save_file(upload)
    if upload['img_file'].nil? 
       upload['img_url']=nil
       return
    end 
    name =  "n#{Time.now.strftime('%d%m%Y%H%m%S')}."+self.sanitize_filename(upload['img_file'].original_filename.last(3))

    directory = "public/images/news"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['img_file'].read) }
    name
 end

 def self.cleanup(filename)
    #File.delete("#{RAILS_ROOT}/public/images/news/#{filename}") if File.exist?("#{RAILS_ROOT}/public/images/news/#{filename}")
 end
 


def self.sanitize_filename(file_name)

  # get only the filename, not the whole path (from IE)
  just_filename = File.basename(file_name) 
  # replace all none alphanumeric, underscore or perioids
  # with underscore
  just_filename.sub! /\A.*(\\|\/)/, ''
  just_filename.gsub! /[^\w\.\-]/, '_'
  just_filename.sub(/[^\w\.\-]/,'_') 
end

end
