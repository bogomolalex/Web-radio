# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  include VarGet

  include AuthenticatedSystem

  layout "base"

  protect_from_forgery 

  rescue_from ActionController::RoutingError, :with => :access_denied2

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

    def access_denied
      respond_to do |format|
        format.html do
          store_location
          redirect_to root_path 
        end
      end
    end

    def access_denied2
      render :nothing=>true ,:status=>'406',
             :text=>"<h4>HTTP Basic: Access denied.\n</h4>"
    end
   
end
