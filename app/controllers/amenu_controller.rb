class AmenuController < MenuController
  layout 'vwamn'
  
  before_filter :get_layout 


  def show
    @mn = Menu.find_all_by_mtype(@mtype)
  end

  private

  def  get_layout
     @adm_menu_id=2
     @mtype= 'ADMARC'

  end

end
