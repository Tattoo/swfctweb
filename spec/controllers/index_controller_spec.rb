require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe IndexController do
  describe "#show" do
    before do
      @project = mock_model(Project)
    end

    it "should render show" do
      get :show
      response.should render_template(:show)
    end

    it "should assign project" do
      Project.should_receive(:active_project).and_return(@project)
      get :show
      assigns(:active_project).should == @project
    end
  end
end

