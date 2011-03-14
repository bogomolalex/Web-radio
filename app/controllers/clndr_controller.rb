class ClndrController < ApplicationController

  def show
   @vd=params[:vd]
   @end_of_date=Date.new(@vd[-4,4].to_i,@vd[-7,2].to_i+1)-1
   @begin_of_date=Date.new(@vd[-4,4].to_i,@vd[-7,2].to_i)
  end

end
