require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  fixtures :programs
  def setup 
   @prog=Program.find_by_value_date(programs(:prog_1).value_date)
  end
  
  def test_presents_of_record 
   assert_equal programs(:prog_1).value_date,@prog.value_date,"Запись загруженная из фикстуры повреждена"
  end

end
