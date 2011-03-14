require 'test_helper'

class UserprofTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def setup
    @admin=Userprof.find_by_username("admin")   
  end

  def test_presents_of_admin
    assert_not_nil @admin,"Нет записи админа!"
  end
end
