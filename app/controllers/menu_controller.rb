class MenuController < ApplicationController

  layout 'mnow' 

  def show
    @mtype= 'ADMNOW' 
    par=sysparam('prog_act') 
    @mn = Menu.find_by_mtype(@mtype,
      :order=>"no").mlist.find(:all,:conditions=>["mtype!='PRGACT' && 'N'=? || 'Y'=?",par,par])

  end

end
