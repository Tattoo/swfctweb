require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe IndexController do
  describe "#show" do
    before do
      @active_projects = mock(Array)
      @future_projects = mock(Array)
    end

    it "should render show" do
      get :show
      response.should render_template(:show)
    end

    it "should assign active projects" do
      Project.should_receive(:active_projects).and_return(@active_projects)
      get :show
      assigns(:active_projects).should == @active_projects
    end

    it "should assign future projects" do
      Project.should_receive(:future_projects).and_return(@future_projects)
      get :show
      assigns(:future_projects).should == @future_projects
    end
  end
end

