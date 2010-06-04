require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe IndexController do
  describe "#show" do
    before do
      @projects = mock(Array)
    end

    it "should render show" do
      get :show
      response.should render_template(:show)
    end

    it "should assign project" do
      Project.should_receive(:active_projects).and_return(@projects)
      get :show
      assigns(:active_projects).should == @projects
    end
  end
end

