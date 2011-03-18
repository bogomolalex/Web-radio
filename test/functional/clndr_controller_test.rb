require 'test_helper'

class ClndrControllerTest < ActionController::TestCase

  # Replace this with your real tests.
  def setup
   @xdat=Date.today
  end
  
  def test_get_array_of_days
   get :show ,:vd=>@xdat.strftime('%d-%m-%Y')
   assert_response :success
  end
end
