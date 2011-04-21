class ProgramController < ApplicationController

 layout 'mnow' 

  
  verify :method=>:post,:only=>'create'

  def show
    @program_dat = Program.find_by_sql("
     SELECT DATE_FORMAT(value_date,'%d.%m.%Y') value_date
       FROM programs
      group by DATE_FORMAT(value_date,'%d.%m.%Y')
      order by 1 desc")
    
  end

  def clndr
    @begin_of_date=Date.strptime("#{params[:vd]}", "%d-%m-%Y")||Date.today+1
    p=Program.find(:first,:select=>" max(value_date) as vd",
                   :conditions=>[" value_date<=? and value_date<?",
                    @begin_of_date+1,Date.today])
    @begin_of_date=p.vd.to_datetime||@begin_of_date||Date.today
    @arc=Program.find(:all,
    :conditions=>["value_date>= ? and value_date<?",
                  @begin_of_date,@begin_of_date+1])
    @arcm=Program.find(:all,:conditions=>["value_date>= ? and value_date<= ?",
                       Date.new(@begin_of_date.year,@begin_of_date.month,1),
                       Date.today-1])

    render :layout=>'marc'
  end

  def towm
    @begin_of_date=Date.strptime("#{params[:vd]}", "%d-%m-%Y")||Date.today+1
    @lst=Program.find(:all,
    :conditions=>["value_date>= ? and value_date<?",
                  @begin_of_date,@begin_of_date+1])
    @lstm=Program.find(:all,:conditions=>["value_date>= ? and value_date<= ?",
                       Date.today+1,
                       Date.new(@begin_of_date.year,@begin_of_date.month+1,1)])
    respond_to do |format|
     if (params[:select]||'no')=="yes" 
         format.html { 
          render "selprg"}
      else
       store_location
       format.html {}
      end
    end
  end

  def edit2
    store_location
    @begin_of_date=Date.strptime("#{params[:vd]}", "%d-%m-%Y")||Date.today+1
    @program=Program.find(:all,
    :conditions=>["value_date>= ? and value_date<?",
                  @begin_of_date,@begin_of_date+1])
  end

  def tune
    @program = Program.find(:all,
                 :conditions=>"date_format(value_date,'%d.%m.%Y')='#{params[:vd]}'",
                 :order=>"value_date ")
   render :layout=>"msys"
  end

  def edit
    @program = Program.find(params[:id])
    @news = @program.news    
  end

  def update
   unless params[:cancel].nil?
     redirect_to_back_or_default({:controller=>"new",:action=>"show"}) 
     return
   end
    @program = Program.find(params[:id])
    @vd="#{@program.value_date.strftime('%d.%m.%Y')}"
    respond_to do |format|
      if @program.update_attributes(params[:program])
        format.html { 
         redirect_to_back_or_default(edit_date_url(@vd)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def new
    begin_of_date=Date.strptime("#{params[:vd]}", "%d-%m-%Y")||Date.today+1
    p=Program.find(:first,:select=>" max(value_date) as vd",
                   :conditions=>["value_date>= ? and value_date<?",
                    begin_of_date,begin_of_date+1])
    @program = Program.new
    @program.title="???"
    @program.description="xxx"
    @program.news.build
    if p[:vd].nil?
     @program.value_date=DateTime.strptime("#{params[:vd]} 08:00", "%d-%m-%Y %H:%M")||DateTime.now
    else
     @program.value_date=p.vd
    end
  end

  def create
   unless params[:cancel].nil?
     redirect_to_back_or_default({:controller=>"new",:action=>"show"}) 
     return
   end
    @program1 = Program.new(params[:program])
    news=@program1.news
    news.each  do |new|
     new.value_date=@program1.value_date
     new.title=@program1.title
     new.img_url=""
    end
    @vd="#{@program1.value_date.strftime('%d.%m.%Y')}"
    respond_to do |format|
     if @program1.save 
        flash[:notice] = 'Programs was successfully created.'
        format.html { 
         redirect_to_back_or_default(edit_date_url(@vd)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def delete2
    @program = Program.find(params[:id])
  end

  def delete99
   @vd="#{params[:vd]}"
   #
   unless params[:create].nil?
    redirect_to :controller => 'program',:action => 'new',:vd=>@vd
    return
   end 
   if params[:chk_id]
    @programs = params[:chk_id].map { |t| Program.find(t) }
    @programs.each { |t| 
     t.destroy }
 redirect_to_back_or_default(edit_date_url(@vd)) 
  else
    redirect_to edit_date_url(@vd)
  end

  end

  def destroy
    @program = Program.find(params[:id])
    @vd="#{@program.value_date.strftime('%d.%m.%Y')}"
    if !params[:cancel]
     @program.destroy
    end
    redirect_to edit_date_url(@vd)
  end

end
