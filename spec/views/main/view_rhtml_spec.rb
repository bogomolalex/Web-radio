require File.dirname(__FILE__) + '/../../spec_helper'
include VarGet
include AuthenticatedTestHelper
include AuthenticatedSystem

describe 'main/view' do
  fixtures :users

  before do
    login_as :quentin
    assigns[:news] = New.find(:all,:conditions=>[" value_date>=? and status='ACT'
                          and menu_id=1",
                          Date.today],:order=>"value_date, no desc")
    assigns[:pact]=sysparam('prog_act')
    render
  end
  
end

