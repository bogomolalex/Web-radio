class MenuController < ApplicationController

  def show
    @mmain = Program.find_by_sql("
     SELECT *
       FROM menus where mtype='MAIN' order by no")
    @mdiv="<div id='mainMenu'>"
    @mmain.each do |m| 
      @mdiv=@mdiv+"<div id='m#{m.id}'>#{m.title}</div>"
    end
    @mdiv=@mdiv+"</div>"
#	   render :layout=>false
  end

end
