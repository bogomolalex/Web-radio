require 'spec_helper'

describe 'Programs model' do

  before(:each) do
    @valid_attributes = {:title=>"Test",:description=>"Test2",
                         :image_url=>"Test3"}
  end

  it "should have the filled Title field " do
    p=Program.new
    p.should_not be_valid
    p.errors.on(:title).should_not be_nil
  end
 
  it "should create a new instance given valid attributes" do
    Program.create!(@valid_attributes)
  end

    
  it 'should have default value for value_date' do
     p = Program.new(@valid_attributes)
     p.value_date.should be_nil
     p.save
     p.value_date.strftime('%d.%m.%Y').should == Date.today.strftime('%d.%m.%Y')
  end

  it "value_date should be == Factory->:program.value_date " do
     pr = Factory(:program)
     p=Program.new(@valid_attributes)
     p.value_date.should be_nil
     p.save
     p.value_date.strftime('%d.%m.%Y').should == pr.value_date.strftime('%d.%m.%Y')
  end

end
