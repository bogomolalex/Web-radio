desc "Test "
namespace :loggs do
task :created =>:environment do
 l= Loggs.find(:all,:conditions=>["event=?","CREATED"])
 l.each do |ll|
  puts "#{ll.username}"
 end
end
end