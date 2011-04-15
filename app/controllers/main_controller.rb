class MainController < ApplicationController

  def view
    @program = Program.find(:all)
  end

  def about
    @program = Program.find(:all)
    render :layout=>'about'
  end

  def online
    @program = Program.find(:all)
    render :layout=>'online'
  end

  def list
    @program = Program.find(:all)
    render :partial => 'program/list', :object => @program
  end

end
