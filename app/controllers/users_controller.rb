class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  

  # render new.rhtml
  def new
#   redirect_back_or_default('/')
   @user = User.new
  end
 
  def create
#   redirect_back_or_default('/')
 #  return;
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save

    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      l=Loggs.new
      l.username=@user.login
      l.message="Создан новый пользователь. IP: #{request.remote_ip}"
      l.event='CREATED'
      l.created_at=Time.now
      l.logg_date=Date.today
      l.save
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
end
