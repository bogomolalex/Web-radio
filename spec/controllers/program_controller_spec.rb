require File.dirname(__FILE__) + '/../spec_helper'

include VarGet
include AuthenticatedTestHelper
include AuthenticatedSystem
describe ProgramController do
  #before_filter :login_required
  fixtures :users
  #Delete this example and add some real ones
  describe 'controller' do
  it "should use ProgramController" do
    controller.should be_an_instance_of(ProgramController)
  end
  end

  describe 'New controller' do
   before do
     login_as :quentin
   end

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
      login_as :quentin
    end

    it "should be successful rending" do
     get :edit2,:vd=>Date.today.strftime('%d-%m-%Y')
     response.should(render_template('edit2'))
    end

    it "should create a new record " do
     get :edit2,:vd=>Date.today.strftime('%d-%m-%Y')
     assigns[:program].should_not be_nil
     assigns[:program].size.should == 3
    end

  end

  describe 'Update current program ' do

    before do
      @p= Factory(:item)
      login_as :quentin
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
     # РЎРѕР·РґР°РµРј С„РёРєС‚РёРІРЅС‹Р№ РѕР±СЉРµРєС‚
     @tmpm=mock_model(Program,:value_date=>Date.today,:title=>"Title")
     # РџРµСЂРµРіСЂСѓР¶Р°РµРј РµРіРѕ РјРµС‚РѕРґ 'update_attributes' c РІРѕР·СЂР°С‚РѕРј
     # 'false'. (СЃРј. program_controller.update)
     @tmpm.should_receive(:update_attributes).and_return(false)
     @tmpm.errors.should_receive(:invalid?).at_least(5).times.and_return(false)
     # РџРµСЂРµРіСЂСѓР¶Р°РµРј РјРµС‚РѕРґ 'find' РєР»Р°СЃСЃР° Program Рё РІРѕР·РІСЂР°С‰Р°РµРј РЅР°С€ С„РёРєС‚РёРІРЅС‹Р№ РѕР±СЉРµРєС‚
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
    login_as :quentin
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
        login_as :quentin
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
