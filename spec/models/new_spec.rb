require File.dirname(__FILE__) + '/../spec_helper'

describe New do
  before(:each) do
    @valid_attributes = {:title=>"Тест",
      :img_url=>"none.jpg",
      :value_date=>Date.today,
      :no=>1,
      :menu_id=>1,
      :program_id=>1,
      :descr=>"Какой-нибудь текст новости",
#      :status=>'NEW',
      :ntype=>'NEWS'
    }
  end

  it "should create a new instance given valid attributes" do
    New.create!(@valid_attributes)
  end

  it "should have default 'NEW' status" do
   @item=Factory(:new1)
   New.find_by_id(@item.id).status.should == 'NEW'
  end

  it "should change status to 'ACT'" do
   @item=Factory.build(:new1)
   @item.status='ACT'
   @item.save
   New.find_by_id(@item.id).status.should == 'ACT'
  end

  context 'check requeried fields' do

    [:title,:value_date,:status,:ntype].each do |attr|
     it "should not create new instance without :#{attr}" do
       @valid_attributes[attr]=nil
       p=New.new(@valid_attributes)
       p.should_not be_valid
       p.errors.on(attr).should_not be_nil
      end
    end
  end

  it "should have short_descr field" do
       p=New.new(@valid_attributes)
       p.short_descr.should_not be_nil
  end

end
