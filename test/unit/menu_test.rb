require 'test_helper'

class MenuTest < ActiveSupport::TestCase
  fixtures :menus

  def setup
    @menu=Menu.find(:all)   
  end
 
  def test_must_have_menu_records
    assert_not_equal 0,@menu.size,"No records!"
  end

end
