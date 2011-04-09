class MainController < ApplicationController

  def view
#    @page_title = "#{sysparam('title')} - #{cparam('title')}"
    @program = Program.find(:all)
    @mdiv = MenuController.new.show
    respond_to do |format|
     format.html
     format.js
    end
  end

  def list
    @program = Program.find(:all)
    render :partial => 'program/list', :object => @program
  end

 def signup
 end

end
