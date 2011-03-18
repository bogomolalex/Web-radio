class ClndrController < ApplicationController

  def show
   @vd=t(params[:vd])
   @begin_of_date=Date.new(@vd[-4,4].to_i,@vd[-7,2].to_i,@vd[-10,2].to_i)
  end
end
