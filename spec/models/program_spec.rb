require 'spec_helper'

describe Program do

  subject {Factory.build :program}

  before(:each) do
    @valid_attributes = {:title=>"Test",:description=>"Test2",
                         :image_url=>"Test3"}
  end
  
  it "should have the filled Title field " do
    should_not be_valid
    subject.errors.on(:title).should_not be_nil
  end
 
  it "should create a new instance given valid attributes" do
    Program.create!(@valid_attributes)
  end

  it 'should have default value for value_date' do
     subject.title="Test"
     subject.value_date.should be_nil
     subject.save
     subject.value_date.strftime('%d.%m.%Y').should == Date.today.strftime('%d.%m.%Y')
  end

  it 'should be filled by Factory' do
    @items=3.times.inject([]){|res,i| res<<Factory(:item)}
    Program.count.should == 3
  end

  it 'should have programs of today' do
    @items=3.times.inject([]){|res,i| res<<Factory(:item)}
    Program.get_curent_program.should == [@items[0],@items[1],@items[2]]
  end

end
