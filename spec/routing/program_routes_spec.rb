require File.dirname(__FILE__) + '/../spec_helper'

include VarGet
include AuthenticatedTestHelper
include AuthenticatedSystem

describe ProgramController do
 fixtures :users
  before do
     login_as :quentin
  end

  it "should route program/edit2" do
    {:get =>'program/edit2/31.03.2011'}.should route_to(:controller=>'program',
      :action=>'edit2',:vd=>'31.03.2011')
  end

  it "should route program/show" do
    {:get =>'program/show'}.should route_to(:controller=>'program',
      :action=>'show')
  end

  it "should route update " do
    {:put =>'programs/1'}.should route_to(:controller=>'program',
      :action=>'update',:id=>'1')
  end

  it "should route edit for current item" do
    {:get =>'programs/1/edit'}.should route_to(:controller=>'program',
      :action=>'edit',:id=>'1')
  end

end

