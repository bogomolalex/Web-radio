require File.dirname(__FILE__) + '/../spec_helper'

include AuthenticatedTestHelper
include AuthenticatedSystem

describe NewController do

  fixtures :users

  #Delete this example and add some real ones
  it "should use NewController" do
    controller.should be_an_instance_of(NewController)
  end

  describe 'New controller' do
   before do
     login_as :quentin
   end

    it "should be successful rending" do
      get :new
     response.should(render_template('new'))
    end
  end
end
