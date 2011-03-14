require 'test_helper'

class ProgramControllerTest < ActionController::TestCase
  # Replace this with your real tests.

  def test_the_presents_of_id
   assert_equal 1,programs(:prog_1).id,"Нет записи с ИД = 1!!!"
  end
end
