require 'test_helper'

class ProgramControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  
#  def render(args);  get :_renderizer, :args => args;   end

  def test_the_presents_of_id
   assert_equal 1,programs(:prog_1).id,"Нет записи с ИД = 1!!!"
#   objs=render :partial =>"list"
#   assert_equal 0, objs.size
#   assert_response :success
#  assigns.keys.sort.each { |key| puts "'#{key}'" }
#   assert_equal 0, assigns(:objs).size, "Нет записей для списка _list.erb"

  end
end
