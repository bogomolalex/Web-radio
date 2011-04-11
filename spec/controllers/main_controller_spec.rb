require 'spec_helper'

describe MainController do

  describe 'controller' do
    it "should use MainController" do
      controller.should be_an_instance_of(MainController)
    end
  end

 context 'View controller' do
  before do
    get :view
  end
  it "should be successful" do
     response.should  be_success
  end

  it "should be successful rending" do
    response.should(render_template('view'))
  end

  it "should have a variable - list of programs" do
    assigns[:program].should_not be_nil
  end

  it "should have a variable - main Menu" do
    assigns[:mdiv].should_not be_nil
  end
 end

end

