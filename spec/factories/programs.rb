Factory.define :program  do |u|
  u.description "mathieu"
  u.image_url "mathieu"
end

Factory.define :current_user,:class=>"Userprof"  do |u|
  u.id 1
  u.username "admin"
  u.password "1"
end

Factory.define :item , :class=>"Program" do |u|
  u.sequence(:title){|n| "mathieu #{n}"}
  u.sequence(:description){|n| "mathieu #{n}"} 
  u.sequence(:image_url){|n| "mathieu #{n}"} 
  #u.value_date DateTime.now
end

