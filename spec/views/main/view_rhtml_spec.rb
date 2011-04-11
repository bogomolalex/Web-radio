require 'spec_helper'

describe 'main/view' do

  before do
    assigns[:program]= Program.new
    assigns[:c]='1'
    render
  end
  
  it "should have a div for list of programs" do
    should have_tag('div#list_div')
  end

  it "should have a main menu" do
    should have_tag('div#nav')
  end

end

