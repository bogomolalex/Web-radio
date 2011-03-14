class UserprofController < ApplicationController
 before_filter :authorize, :except => [:login,:logout,:view,:signup,:signup2]


 def login
  @u=params['userprof'][:username]
  @p=params['userprof'][:password]
  @c = Userprof.find(:first,:conditions =>  'username="'+"#{@u}"+'" and password="'+"#{@p}"+'"')
  if @c  
   session['userprof'] = @c.id
  end
  redirect_to :controller => "main", :action => "view"
 end

 def logout
   session['userprof'] = nil
  redirect_to :controller => "main", :action => "view"
 end

 def authorize
  return true if @c
  report_error("Unauthorized access; password required")
 end

 def view
 end

 def signup
 end

 def signup2
  redirect_to :controller => "main", :action => "view"
 end
end
