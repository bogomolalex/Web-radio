class ArcmnuController < MenuController
  
  def show
    session['chk_mnu_type']=2
    @mtype= 'ADMARC' 
    @mn = Menu.find_all_by_mtype(@mtype,:order=>"no")
  end


end
