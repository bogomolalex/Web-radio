class ArcmnuController < MenuController

  layout 'marc'   

  def show
    session['chk_mnu_type']=2
    @mtype= 'ADMARC' 
    @mn = Menu.find_by_mtype(@mtype,:order=>"no").mlist
  end


end
