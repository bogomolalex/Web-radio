class LoggsController < ApplicationController
  before_filter :login_required
  layout 'msys'

  def show
    @logs = Loggs.paginate(:all,:per_page=>sysparam('per_page'),
                           :page=>params[:page]||'1',:order=>"created_at desc")
  end

end
