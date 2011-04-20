# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  include HelperProcs

  def show_table(xpar)
    xpar=show_table_params(xpar)
    render :partial => 'shared/tab_vw',:locals=>{:headers=>xpar[:headers],
                :objs=>xpar[:objs],:fields=>xpar[:fields],:crud=>xpar[:crud],
                :url=>xpar[:url],:btns=>xpar[:btns],:but_sub=>xpar[:but_sub]},
           :layout=>xpar[:layout]
  end
  
  def show_calendar(xdate,key={},day_check=lambda{|x,a| x!=a},day_mark=lambda{|x,a| x})
    render :partial => 'shared/clndr',:locals=>{:arr_cl=>get_clndr(xdate),
                                               :a_hash=>key,:xdate=>xdate,
                                               :day_check=>day_check,
                                               :day_mark=>day_mark
                                               },
         :layout=>key[:layout]
  end

  def show_menu(xtype,url=[{}],xtempl=nil)
    menu=show_menu_params(xtype)
    render :partial=>xtempl||"shared/menu",
      :locals=>{:menu=>menu,:mtype=>xtype,:url=>url
                }
  end


end
