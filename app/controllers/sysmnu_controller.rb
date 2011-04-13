class SysmnuController < MenuController

  def show
    session['chk_mnu_type']=3
    @mtype= 'ADMSYS' 
    @mn = Menu.find_all_by_mtype(@mtype,:order=>"no")
  end


end
