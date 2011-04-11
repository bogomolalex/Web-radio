class ProgramController < ApplicationController

  def show
    @program_dat = Program.find_by_sql("
     SELECT DATE_FORMAT(value_date,'%d.%m.%Y') value_date
       FROM programs
      group by DATE_FORMAT(value_date,'%d.%m.%Y')
      order by 1 desc")
    
  end

  def show1
    @programs = Programs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @programs }
    end
  end


  def edit2
    @program = Program.find(:all,
                 :conditions=>"date_format(value_date,'%d.%m.%Y')='#{params[:vd]}'",
                 :order=>"value_date ")
    if @program.size==0
      redirect_to :controller=>"program",:action=>"show"
    end 
  end

  def edit
    @program = Program.find(params[:id])
  end

  def update
    @program = Program.find(params[:id])
    @vd="#{@program.value_date.strftime('%d.%m.%Y')}"
    respond_to do |format|
      if @program.update_attributes(params[:program])
        format.html { 
         redirect_to edit_date_url(@vd)}
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def new
    @program = Program.new
    @program.title="???"
    @program.description="xxx"
    @program.value_date=Time.new
  end

  def create
    @program = Program.new(params[:program])
    @vd="#{@program.value_date.strftime('%d.%m.%Y')}"
    respond_to do |format|
      if @program.save
        flash[:notice] = 'Programs was successfully created.'
        format.html { redirect_to edit_date_url(@vd) }
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
    redirect_to :controller => 'program',:action => 'new'
    return
   end 
   if params[:chk_id]
    @programs = params[:chk_id].map { |t| Program.find(t) }
    @programs.each { |t| 
     t.destroy }
    redirect_to edit_date_url(@vd)
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
