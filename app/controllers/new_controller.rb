class NewController < ApplicationController

  layout 'mnow' 
  
  verify :method=>:post,:only=>[:create,:destroy], :redirect_to => {:controller=>'main',:action=>'view'}
  verify :method=>:put,:only=>[:update], :redirect_to => {:controller=>'main',:action=>'view'}

  def index
   redirect_to :controller=>"menu",:action=>"show"
  end

  def show
    @vnews = New.find(:all)
  end

  def edlist
    store_location
    @vnews=New.paginate(:all,:per_page=>sysparam('per_page'), :page=>params[:page]||'1',
                             :conditions=>[" value_date>=? and status!='ACT'
                               and menu_id=1 or status!='ACT' and menu_id!=1",Date.today-10],
    :order=>"menu_id desc,value_date desc,no desc ")
  end

  def mkact
    store_location
    @vnews=New.paginate(:all,:page=>params[:page]||'1',:per_page=>sysparam('per_page'),
                             :conditions=>[" (value_date>=? and menu_id=1 or menu_id!=1)and status in ('NEW','ACT')",Date.today],
                             :order=>"menu_id desc,value_date desc,no desc ")
  end

  def arcnew
    store_location
    @vnews=New.paginate(:all,:page=>params[:page]||'1',:per_page=>sysparam('per_page'),
                             :conditions=>["(value_date<? and menu_id=1 ) and status in ('ACT','NEW') ",Date.today],:order=>"value_date desc")
    render :layout=>'marc'   
  end

  def edit
    @vnew = New.find(params[:id])
  end

  def update
   # Переходы в зависимости от значений в форме.
   unless params[:sel_prog].nil?
     redirect_to :controller=>"program",:action=>"towm",:vd=>(DateTime.now).strftime('%d-%m-%Y'),:id=>params[:id],:select=>"yes"
     return
   end
   unless params[:cancel].nil?
     redirect_to_back_or_default({:controller=>"new",:action=>"show"}) 
     return
   end
   #
    @vnew = New.find(params[:id])
    unless params[:upload].nil?
     New.cleanup(@vnew.img_url)
     params[:new][:img_url]= New.save_file(params[:upload]) 
    end
    respond_to do |format|
      if @vnew.update_attributes(params[:new])
        format.html { 
         redirect_to_back_or_default({:controller=>"new",:action=>"show"}) 
         }
      else
        validate_fields
        format.html { render :action => "edit" }
      end
    end
  end

  def new
    @vnew = New.new
    @vnew.title=""
    @vnew.no=100
    @vnew.img_url="none"
    @vmn=Menu.find_by_mtype('MAIN')
  end

  def create
   unless params[:sel_prog].nil?
     redirect_to :controller=>"program",:action=>"towm",:vd=>(DateTime.now).strftime('%d-%m-%Y'),:id=>params[:id],:select=>"yes"
     return
   end
   unless params[:cancel].nil?
     redirect_to_back_or_default({:controller=>"new",:action=>"show"}) 
     return
   end
   unless params[:upload].nil?
     params[:new][:img_url]= New.save_file(params[:upload])
   end
    @vnew = New.new(params[:new])
    respond_to do |format|
     if @vnew.save 
        format.html { 
         redirect_to_back_or_default({:controller=>"new",:action=>"show"})}
      else
        validate_fields
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
   unless params[:create].nil?
    redirect_to :controller => 'new',:action => 'new'
    return
   end 
   if params[:chk_id]
    @vnews = params[:chk_id].map { |t| New.find(t) }
    @vnews.each { |t| 
     t.destroy }
   end
   redirect_to_back_or_default({:controller=>"new",:action=>"show"})
  end

  def updact
    if params[:id2].nil?
     store_location
    end
    unless params[:id2].nil?
     n=New.find(params[:id2])
     n.status=case n.status
      when 'NEW'
       'ACT'
      when 'ACT'
       'NEW'
      end
     if n.value_date<Date.today
      n.value_date=Date.today
     end
     n.save
    end
     redirect_to_back_or_default({:controller=>"new",:action=>"mkact"}) 
  end
  
private
 def validate_fields
   flash[:error]=nil
   flash[:notice]=nil
   [:title,:value_date,:no,:menu_id,:status,:ntype,:img_url].each  do |attr|
    if @vnew.errors.invalid?(attr)
       flash[:error] = @vnew.errors[attr]
       break
    end
   end
 end
end

