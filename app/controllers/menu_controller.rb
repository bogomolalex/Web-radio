class MenuController < ApplicationController

  layout 'vwamn'

  def show
    session['chk_mnu_type']=1
    @mtype= 'ADMNOW' 
    @mn = Menu.find_all_by_mtype(@mtype,:order=>"no")
  end

end
