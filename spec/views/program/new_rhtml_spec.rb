require 'spec_helper'

describe 'program/new'do
  before do
    assigns[:program]= Program.new
    assigns[:c]='1'
    render
  end
  it "should have a form for posting people " do
    should have_tag('form')
  end
end

