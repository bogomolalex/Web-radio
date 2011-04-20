class ArcmnuController < MenuController

  layout 'marc'   

  def show
    @mtype= 'ADMARC' 
    @mn = Menu.find_by_mtype(@mtype,:order=>"no").mlist
  end


end
