module HelperProcs
 
  #
 # Массив календаря
 #
  def get_clndr(xdat)
   begin_of_date=Date.new(xdat.year,xdat.month,1)
   end_of_date=Date.new(xdat.year,xdat.month+1,1)-1
   #
   ar=(begin_of_date..end_of_date).map{|dn| [dn.cwday,dn.day,dn.strftime('%d-%m-%Y')] }
   ar_beg=(1..ar[0][0]-1).map do |xday|
     [xday,0]
   end
   ar_end=(ar[ar.size-1][0]+1..7).map do |xday|
     [xday,0]
   end
   #
   ar_beg+ar+ar_end
  end

  def show_table_params(xpar)
   xpar[:fields]||=[{:id=>"id",:proc=>lambda{|item| "Id:"+item}}]
   xpar[:crud]||=false
    # кнопка по умолчанию submit
   unless xpar[:url].nil?
     xpar[:but_sub]||={:text=>t(:Butt_Send)}
   end
    # кнопки по умолчанию для CRUD
   if xpar[:crud]
    xpar[:url]||={:controller=>"",:action=>"",:id=>""}
    # кнопки по умолчанию для CRUD
    if xpar[:btns].nil?
     xpar[:btns]||=Array.new
     xpar[:btns]<<{:name=>"delete",:text=>t(:Butt_Delete),:controller=>"",:action=>"delete",:id=>"#{params[:id]}" }
     xpar[:but_sub]={:text=>t(:Butt_Create)}
    end
   end
   xpar
  end

  def show_menu_params(xtype)
    Menu.find(:all,:conditions=>["mtype=?","#{xtype}"],:order=>"no")
  end
    
end
