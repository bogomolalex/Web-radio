class MainController < ApplicationController

  def view
    @program = Program.find(:all)
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
