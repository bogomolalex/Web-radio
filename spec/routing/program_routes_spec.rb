require 'spec_helper'

describe ProgramController do

  it "should route program/edit2" do
    {:get =>'program/edit2/31.03.2011'}.should route_to(:controller=>'program',
      :action=>'edit2',:vd=>'31.03.2011')
  end

  it "should route program/show" do
    {:get =>'program/show'}.should route_to(:controller=>'program',
      :action=>'show',:id=>'show')
  end

  it "should route update " do
    {:put =>'program/1'}.should route_to(:controller=>'program',
      :action=>'update',:id=>'1')
  end

  it "should route edit for current item" do
    {:get =>'program/1/edit'}.should route_to(:controller=>'program',
      :action=>'edit',:id=>'1')
  end

end

