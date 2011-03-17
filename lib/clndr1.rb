require "date.rb"
# 
#  Календарь
#
  def get_clndr(xdat)
   begin_of_date=Date.new(xdat.year,xdat.month,1)
   end_of_date=Date.new(xdat.year,xdat.month+1,1)-1
   # 
   ar=(begin_of_date..end_of_date).map{|dn| [dn.cwday,dn.day] }
   ar_beg=(1..ar[0][0]-1).map do |xday| 
     [xday,0]
   end
   ar_end=(ar[ar.size-1][0]+1..7).map do |xday| 
     [xday,0]
   end
   #
   ar_beg+ar+ar_end
  end
