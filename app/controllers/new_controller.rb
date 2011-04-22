class NewController < ApplicationController

  layout 'mnow' 
  
  verify :method=>:post,:only=>'create'

  def show
    @vnews = New.find(:all)
  end

  def edlist
    store_location
    @vnews=New.paginate(:all,:page=>params[:page]||'1',
                             :conditions=>[" value_date>=?",Date.today])
#    @vnews = @vnews.paginate 
  end

  def edit
    @vnew = New.find(params[:id])
  end

  def update
   unless params[:sel_prog].nil?
     redirect_to :controller=>"program",:action=>"towm",:vd=>(DateTime.now).strftime('%d-%m-%Y'),:id=>params[:id],:select=>"yes"
     return
   end
   unless params[:cancel].nil?
     redirect_to_back_or_default({:controller=>"new",:action=>"show"}) 
     return
   end
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
        format.html { render :action => "edit" }
      end
    end
  end

  def new
    @vnew = New.new
    @vnew.title="?"
    @vnew.no=100
    @vnew.img_url="none"
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
    vnew = New.new(params[:new])
    respond_to do |format|
     if vnew.save 
        flash[:notice] = 'Programs was successfully created.'
        format.html { 
         redirect_to_back_or_default({:controller=>"new",:action=>"show"}) 
}
      else
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
    redirect_to_back_or_default({:controller=>"new",:action=>"show"}) 
   end
  end

end

