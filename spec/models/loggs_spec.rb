require 'spec_helper'

describe Loggs do
  before(:each) do
    @valid_attributes = {
   :username=>"admin",
   :event=>"NEW",
   :logg_date=>Date.today
    }
  end

  it "should create a new instance given valid attributes" do
    Loggs.create!(@valid_attributes)
  end
end
