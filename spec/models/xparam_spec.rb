require 'spec_helper'

describe Xparam do
  
  before do
    @valid_attributes = {
      :name=>"Test",
      :ptype=>"SYS",
      :value_str=>"testing strinf",
      :value_date=>Date.today,
      :value_num=>1,
      :inserted=>DateTime.now,
      :inserted_by=>'USER',
      :updated=>DateTime.now,
      :updated_by=>'USER2'
    }
  end

  it "should create a new instance given valid attributes" do
    Xparam.create!(@valid_attributes)
  end

  context 'check requeried fields' do

    [:inserted,:inserted_by,:name,:ptype].each do |attr|
     it "should not create new instance without :#{attr}" do
       @valid_attributes[attr]=nil
       p=Xparam.new(@valid_attributes)
       p.should_not be_valid
       p.errors.on(attr).should_not be_nil
      end
    end
  end

 context 'Default values ' do

    [:updated,:updated_by].each do |attr|
        it "should set to :#{attr}" do
         @valid_attributes[attr]=nil
         p=Xparam.new(@valid_attributes)
         p.save
         p[attr].should_not be_nil
        end
    end
 end

end
