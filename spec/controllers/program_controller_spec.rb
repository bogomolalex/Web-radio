require 'spec_helper'

describe ProgramController do
   #Delete this example and add some real ones
  describe 'controller' do
  it "should use ProgramController" do
    controller.should be_an_instance_of(ProgramController)
  end
  end
 describe 'Show controller' do

  it "should be successful" do
     get :show ,:vd=>Date.today.strftime('%d.%m.%Y')
     response.should  be_success
  end

  it "should be successful rending" do
    get :show 
    response.should(render_template('show'))
    #p=Factory(:current_user)
    #session.should_receive(:[]).with('userprof').twice.and_return([1])
    #controller.should_receive(:render).with(:partial => 'program/grplst')
    #controller.should render_template('show')
  end

  it "should be fetch list of dates" do
    p= 3.times.inject([]){|res,i| res<<Factory(:item)}
    get :show 
    assigns[:program_dat].count.should == 1
  end


  end

  describe 'New controller' do

    it "should be successful rending" do
     get :new
     response.should(render_template('new'))
    end

    it "should create a new record " do
     get :new
     assigns[:program].should_not be_nil
     assigns[:program].should be_kind_of(Program)
     assigns[:program].should be_new_record
    end

  end

  describe 'Edit current list edit2 ' do
    before do
      p= 3.times.inject([]){|res,i| res<<Factory(:item)}
    end

    it "should be successful rending" do
     get :edit2,:vd=>Date.today.strftime('%d.%m.%Y')
     response.should(render_template('edit2'))
    end

    it "should create a new record " do
     get :edit2,:vd=>Date.today.strftime('%d.%m.%Y')
     assigns[:program].should_not be_nil
     assigns[:program].size.should == 3
    end

  end

  describe 'Update current program ' do

    before do
      @p= Factory(:item)
    end

    it "should create a new record " do
     get :update,:id=>@p.id,:program=>{:title=>"Changed"}
     Program.find(@p.id).title.should == "Changed"
    end

    it "should be redirected to edit2 view" do
     get :update,:id=>@p.id,:program=>{:title=>"Changed"}
     response.should be_redirect
     response.should(redirect_to(edit_date_url(@p.value_date.strftime('%d.%m.%Y'))))
    end

    it "should not be redirected, and rendered template 'edit'" do
     # Создаем фиктивный объект
     @tmpm=mock_model(Program,:value_date=>Date.today)
     # Перегружаем его метод 'update_attributes' c возратом
     # 'false'. (см. program_controller.update)
     @tmpm.should_receive(:update_attributes).and_return(false)
     # Перегружаем метод 'find' класса Program и возвращаем наш фиктивный объект
     Program.should_receive(:find).and_return(@tmpm)
     get :update,:id=>@p.id,:program=>{:title=>"Changed"}
     response.should_not be_redirect
     response.should(render_template('edit'))
    end


  end

end
