class MainController < ApplicationController

  def view
    @program = Program.find(:all)
  end

  def list
    @program = Program.find(:all)
    render :partial => 'program/list', :object => @program
  end

 def signup
 end

end
