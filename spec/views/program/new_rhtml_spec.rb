require File.dirname(__FILE__) + '/../../spec_helper'

include VarGet
include AuthenticatedTestHelper
include AuthenticatedSystem

describe 'program/new'do
  fixtures :users

  before do
    login_as :quentin
    p=Program.new
    p.news.build
    assigns[:program] = p
    #assign[:program].news.build

    render
  end
  it "should have a form for posting people " do
    should have_tag('form')
  end
end

