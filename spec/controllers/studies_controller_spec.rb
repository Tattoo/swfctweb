require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StudiesController do
  describe "#show" do
    before do
      @id = "study1"
      @study = mock_model(Study)
    end

    it "should render show" do
      Study.stub!(:find).and_return(@study)
      get :show, :id => @id
      response.should render_template(:show)
    end

    it "should assign study" do
      Study.should_receive(:find).with(:first, :conditions => {:key => @id}).and_return(@study)
      get :show, :id => @id
      assigns(:study).should == @study
    end

    it "should redirect to root if unknown key" do
      Study.stub!(:find).and_return(nil)
      get :show, :id => @id
      response.should redirect_to(root_path)
    end
  end

  describe "#index" do
    it "should render index" do
      get :index
      response.should render_template(:index)
    end

    it "should assign studies" do
      @studies = mock(Array)
      Study.should_receive(:all).and_return(@studies)
      get :index
      assigns(:studies).should == @studies
    end
  end
end

