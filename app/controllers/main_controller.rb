class MainController < ApplicationController

  def view
    @news = New.find(:first,:conditions=>[" value_date>=? and status='ACT'
                          and menu_id=1 ",
                          Date.today],:order=>"value_date, no desc")
    @pact=sysparam('prog_act')
    @cdat=params[:vd]||Date.today
    @qstr = New.find(:first,:conditions=>[" status='ACT'
                                        and menu_id=21"]);
    render :layout=>'mbase'
  end

  def about
    @news = New.find(:all,:conditions=>["status='ACT'
                          and menu_id=3 "],:order=>"value_date,no desc")
    render :layout=>'about'
  end

  def online
    @news = New.find(:all,:conditions=>[" status='ACT'
                          and menu_id=2"],:order=>"value_date, no desc")
    render :layout=>'online'
  end

  def news
    @news = New.find_by_id(params[:id])
  end

  def list
    @program = Program.find(:all)
    @cdat = Date.strptime("#{params[:vd]}", "%d.%m.%Y") unless params[:vd].nil?
    render :partial => 'program/list', :object => @program
  end

  def qstr
    @qstr = New.find(:first,:conditions=>[" status='ACT'
                                        and menu_id=21
                                and id>? ",params[:id9]]);
    if @qstr.nil?
     @qstr = New.find(:first,:conditions=>[" status='ACT' and menu_id=21"]);
    end
      render :partial => 'new/qstr'
  end

end
