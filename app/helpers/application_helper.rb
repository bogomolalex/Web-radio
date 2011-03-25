# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

 #
 # ���ᨢ ���������
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
   xpar[:fields]||=[{:id=>"id",:proc=>lambda{|item| "Id:"+item}}]
   xpar[:crud]||=false
    # ������ �� 㬮�砭�� submit
   unless xpar[:url].nil?
     xpar[:but_sub]||={:text=>t(:Butt_Send)}
   end
    # ������ �� 㬮�砭�� ��� CRUD
   if xpar[:crud]
    xpar[:url]||={:controller=>"",:action=>"",:id=>""}
    # ������ �� 㬮�砭�� ��� CRUD
    if xpar[:btns].nil?
     xpar[:btns]||=Array.new
     xpar[:btns]<<{:name=>"delete",:text=>t(:Butt_Delete),:controller=>"",:action=>"delete",:id=>"#{params[:id]}" }
     xpar[:but_sub]={:text=>t(:Butt_Create)}
    end
   end
    render :partial => 'shared/tab_vw',:locals=>{:headers=>xpar[:headers],
                :objs=>xpar[:objs],:fields=>xpar[:fields],:crud=>xpar[:crud],
                :url=>xpar[:url],:btns=>xpar[:btns],:but_sub=>xpar[:but_sub]}
  end

  def show_menu(xtype)
    menu = Menu.find(:all,:conditions=>["mtype=?","#{xtype}"],:order=>"no")
    render :partial=>"shared/menu",:locals=>{:menu=>menu,:mtype=>xtype}
  end

end
