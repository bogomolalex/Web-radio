Factory.define :sysparam ,:class=>"Xparam" do |u|
      u.name  "Test"
      u.ptype "SYS"
      u.value_str "testing strinf"
      u.value_date Date.today
      u.value_num 1
      u.inserted DateTime.now
      u.inserted_by 'USER'
      u.updated DateTime.now
      u.updated_by 'USER2'
end

