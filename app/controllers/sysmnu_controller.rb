class SysmnuController < MenuController

  before_filter :login_required

  layout 'msys' 

  def show
    @mtype= 'ADMSYS' 
    @mn = Menu.find_by_mtype(@mtype,:order=>"no").mlist
  end


end
