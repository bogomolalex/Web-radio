require File.dirname(__FILE__) + '/../spec_helper'
include VarGet

describe 'Testing VagGet' do
  before do
    @p= Factory(:sysparam)
  end

  it "should get system parameter" do
    sysparam("Test").should == 1
  end

  it "should get correct page's title" do
    m=mock('mock',:value_num=>nil,:value_date=>nil,:value_str=>'title')
    Xparam.stub!(:find).and_return(m)
    get_page_title.should == 'title - title'
  end

end

