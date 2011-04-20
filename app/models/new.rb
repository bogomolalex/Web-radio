
class New < ActiveRecord::Base

 def short_descr
    read_attribute('descr')[0,80]+'...'
 end 

 def self.save_file(upload)
    if upload['img_file'].nil? 
       upload['img_url']=nil
       return
    end 
    name =  "new#{sanitize_filename(upload['img_file'].original_filename)}"
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
  just_filename.sub(/[^\w\.\-]/,'_') 
end


end
