# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  include VarGet

  def _renderizer;  render params[:args];  end


  layout "base"

  before_filter :set_customer
  
  def set_customer
   if session['userprof']
     @c = Userprof.find(session['userprof'])
   end
  end

  private
   def report_error(message)
    @message = message
    render("main/error")
   return false
  end

end
