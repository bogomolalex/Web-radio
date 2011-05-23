# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem

  # render new.erb.html
  def new
   flash[:error] =nil
  end

  def create
    logout_keeping_session!
    p=params["/session"]
    p[:password]||=nil
    p[:login]||=nil
    user = User.authenticate(p[:login], p[:password])
    if user
      # Protects against session fixation attacks, causes request forgery
      # protection if user resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset_session
      self.current_user = user
      new_cookie_flag = (p[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      redirect_back_or_default('/')
      flash[:notice] = "Вы вошли в систему."
    else
      note_failed_signin
      @login       = p[:login]
      @remember_me = p[:remember_me]
      render :action => 'new'
    end
  end

  def destroy
    logout_killing_session!
    flash[:notice] = "Вы вышли из системы."
    redirect_back_or_default('/')
  end

protected
  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Не возможно войти как '#{params['/session'][:login]}'"
    logger.warn "Ошибка входа в систему пользователем '#{params['/session'][:login]}' IP: #{request.remote_ip} время: #{Time.now.utc}"
  end
end
