
class New < ActiveRecord::Base

 validates_presence_of :title,:value_date,:status,:ntype,:message=>'Не заполнен '

 cattr_reader :per_page
 @@per_page =5

 belongs_to :program

 def short_descr
    (descr||'xxx').first(80)+"..."
 end 

 def self.save_file(upload)
    if upload['img_file'].nil? 
       upload['img_url']=nil
       return
    end 
    name =  "new#{Digest::SHA1.hexdigest Time.now.to_s}"
    directory = "public/images/news"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['img_file'].read) }
    name
 end

 def self.cleanup(filename)
    File.delete("#{RAILS_ROOT}/public/images/news/#{filename}") if File.exist?("#{RAILS_ROOT}/public/images/news/#{filename}")
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
