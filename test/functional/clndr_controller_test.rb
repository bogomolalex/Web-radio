require 'test_helper'

class ClndrControllerTest < ActionController::TestCase

  # Replace this with your real tests.
  def setup
   @xdat=Date.today
  end
  
  def test_get_array_of_days
   @arr = get_clndr(@xdat)
   assert_not_nil @arr,"Массив календаря пуст"
   assert_not_equal 0,@arr.size,"Массив имеет размер 0"
  end
end
