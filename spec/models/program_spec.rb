require 'spec_helper'

describe Program do
  before(:each) do
    @valid_attributes = {:title=>"Test",:description=>"Test2",
                         :image_url=>"Test3"}
  end

  it "Value_date must be present" do
    p=Program.new
    p.should_not be_valid
    p.errors.on(:title).should_not be_nil
  end
 
  it "should create a new instance given valid attributes" do
    Program.create!(@valid_attributes)
  end

    
    it 'value_date should have today' do
     lmb=lambda do
       |t| 
         t.strftime('%d.%m.%Y') 
      end
     p=Program.new(@valid_attributes)
     p.value_date.should be_nil
     p.save
    lmb.call(p.value_date).should == Date.today.strftime('%d.%m.%Y')
    end


end
