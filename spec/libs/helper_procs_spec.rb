require  'spec_helper'
include HelperProcs

describe HelperProcs do

  context 'Get_clndr ' do
   
  it "should get array of dates " do
    p=get_clndr(Date.today)
    p.should be_kind_of(Array)
    p.size.should_not == 0
  end
 end
 context 'show_table' do
   before do
      stub!(:params).and_return {"1"}
      stub!(:t).and_return("Buttom name")
      @p=show_table_params({:crud=>true})
   end
    it 'should has default field ID' do
     @p[:fields].should be_kind_of(Array)
     @p[:fields][0][:id].should =="id"
   end
  context 'if have :CRUD=true then' do

   it 'should have an :url ' do
     @p[:url].should be_kind_of(Hash)
     @p[:url][:controller].should ==""
   end

   it 'should have buttons :delete,:create ' do
     @p[:btns].should be_kind_of(Array)
     @p[:btns][0][:name].should == "delete"
     @p[:but_sub].should_not be_nil
   end
   end
  end
  context 'show_menu_params' do
    it 'should have Menu objects' do
      Factory(:xmenu,{:id=>nil,:menu_id=>nil})
      p=show_menu_params('MAIN')
      p.size.should == 1
    end
  end
end

