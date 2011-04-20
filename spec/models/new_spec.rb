require 'spec_helper'

describe New do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    New.create!(@valid_attributes)
  end
end
