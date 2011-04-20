class SysmnuController < MenuController

  layout 'msys' 

  def show
    @mtype= 'ADMSYS' 
    @mn = Menu.find_by_mtype(@mtype,:order=>"no").mlist
  end


end
