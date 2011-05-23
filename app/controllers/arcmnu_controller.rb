class ArcmnuController < MenuController

  before_filter :login_required

  layout 'marc'   

  def show
    @mtype= 'ADMARC' 
    @mn = Menu.find_by_mtype(@mtype,:order=>"no").mlist
  end


end
