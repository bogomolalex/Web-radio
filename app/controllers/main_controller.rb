class MainController < ApplicationController

  def view
    @program = Program.find(:all)
    @news = New.find(:all,:conditions=>[" value_date>=? and status='ACT'
                          and menu_id=1",
                          Date.today],:order=>"value_date, no desc")
    @pact=sysparam('prog_act')
  end

  def about
    @program = Program.find(:all)
    @news = New.find(:all,:conditions=>[" value_date>=? and status='ACT'
                          and menu_id=3",
                          Date.today],:order=>"value_date, no desc")
    render :layout=>'about'
  end

  def online
    @program = Program.find(:all)
    @news = New.find(:all,:conditions=>[" value_date>=? and status='ACT'
                          and menu_id=2",
                          Date.today],:order=>"value_date, no desc")
    render :layout=>'online'
  end

  def list
    @program = Program.find(:all)
    render :partial => 'program/list', :object => @program
  end

end
