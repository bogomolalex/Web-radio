require File.dirname(__FILE__) + '/../spec_helper'

include VarGet

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
  describe "POST 'create'" do
    before do
      @prog_params={:program=>{:title=>"ssss",:description=>"wwerwer",
                    :image_url=>"ddd",:value_date=>DateTime.now
                  }}
    end

    context "when succesful" do

      it "should redirect to edit_date_url" do
        post :create,@prog_params
        response.should redirect_to(edit_date_url(assigns[:vd]))
      end

      it "should create record" do
       lambda {
         post :create,@prog_params
       }.should change(Program,:count).by(1)
      end

    end
    context "when failure" do
      before do
        @prog_params[:program][:title]=''
      end

      it "re-renders 'new'" do
        post :create,@prog_params
        response.should render_template('new')
      end
      it "do not create record" do
       lambda {
         post :create,@prog_params
        }.should_not change(Program,:count)
      end
    end
  context 'when using other verb than POST' do
    it 'rejects request' do
      controller.should_not_receive(:create) 
      get :create,@prog_params
    end
  end
  end
 
  context 'should have access to self parameters :cparam' do
   it "should get current class parameter" do
    valid_attributes = {
      :name=>"Test",
      :ptype=>'Spec',
      :value_str=>"testing strinf",
      :inserted=>DateTime.now,
      :inserted_by=>'USER'}
     p=Xparam.create!(valid_attributes)
     get_module_name.should == 'Spec'
     cparam("Test").should == "testing strinf"
   end
  end
end
