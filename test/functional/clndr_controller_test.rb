require 'test_helper'

class ClndrControllerTest < ActionController::TestCase

  # Replace this with your real tests.
  def setup
   @xdat=Date.today
  end
  
  def test_get_array_of_days
   @arr = get_clndr(@xdat)
   assert_not_nil @arr,"���ᨢ ��������� ����"
   assert_not_equal 0,@arr.size,"���ᨢ ����� ࠧ��� 0"
  end
end
