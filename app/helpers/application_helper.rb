# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

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

  def show_calendar(xdate,key={})
   render :partial => 'shared/clndr',:locals=>{:arr_cl=>get_clndr(xdate),
                                               :a_hash=>key,:xdate=>xdate}
  end

  def show_table(xpar)
   xpar[:fields]||=["id"]
   xpar[:crud]||=true
   xpar[:url]||=""
   render :partial => 'shared/tab_vw',:locals=>{:headers=>xpar[:headers],
                :objs=>xpar[:objs],:fields=>xpar[:fields],:crud=>xpar[:crud],
                :url=>xpar[:url]}
  end

end
