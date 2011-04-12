class MenuController < ApplicationController

  @mtype= 'MAIN'

  def show
    @mmain = Menu.find_by_sql("
     SELECT *
       FROM menus where mtype='#{@mtype}' order by no")
    @mdiv="<div>"
    @mmain.each do |m| 
      @mdiv=@mdiv+"<div id='m#{m.id}'>#{m.title}</div>"
    end
    @mdiv=@mdiv+"</div>"
#	   render :layout=>false
  end


end
