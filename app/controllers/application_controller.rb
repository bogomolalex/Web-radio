# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  include VarGet

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

  def store_location
    session['saved_location'] = request.request_uri
  end

  def redirect_to_back_or_default(default)
    if session['saved_location'].nil?
      redirect_to default
      session['saved_location'] = nil
    else
      redirect_to session['saved_location']
      session['saved_location'] = nil
    end
  end


end
