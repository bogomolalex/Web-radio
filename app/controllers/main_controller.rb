class MainController < ApplicationController

  def view
    @news = New.find(:all,:conditions=>[" value_date>=? and status='ACT'
                          and menu_id=1",
                          Date.today],:order=>"value_date, no desc")
    @pact=sysparam('prog_act')
  end

  def about
    @news = New.find(:all,:conditions=>["status='ACT'
                          and menu_id=3"],:order=>"value_date,no desc")
    render :layout=>'about'
  end

  def online
    @news = New.find(:all,:conditions=>[" status='ACT'
                          and menu_id=2"],:order=>"value_date, no desc")
    render :layout=>'online'
  end

  def list
    @program = Program.find(:all)
    render :partial => 'program/list', :object => @program
  end

end
