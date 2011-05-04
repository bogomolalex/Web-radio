class XparamController < ApplicationController

  layout 'msys' 

  def edit
    @vprm = Xparam.find_all_by_ptype('SYS')
  end

  def update
   updattr("per_page")
   updattr("title")
   updattr("prog_act")
   redirect_to :action=>"edit"
  end

 private 
  def updattr(attr_name)
   pval=params[attr_name.to_sym]
   if pval.nil?
    return
   end
   at=Xparam.find(:first,:conditions=>["ptype='SYS' and name=?",attr_name])
   if at.nil?
    return
   end
   unless at.value_str.nil?
     at.value_str=pval
   end
   unless at.value_date.nil?
     at.value_date=pval
   end
   unless at.value_num.nil?
     at.value_num=pval
   end
   at.save
  end 

end
