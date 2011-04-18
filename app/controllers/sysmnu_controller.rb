class SysmnuController < MenuController

  layout 'msys' 

  def show
    session['chk_mnu_type']=3
    @mtype= 'ADMSYS' 
    @mn = Menu.find_by_mtype(@mtype,:order=>"no").mlist
  end


end
