class MenuController < ApplicationController

  layout 'mnow' 

  def show
    @mtype= 'ADMNOW' 
    @mn = Menu.find_by_mtype(@mtype,:order=>"no").mlist
  end

end
