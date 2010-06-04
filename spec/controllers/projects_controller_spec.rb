require 'spec_helper'

describe ProjectsController do

  describe "index" do
    it "should render index" do
      get :index
      response.should render_template(:index)
    end
  end

  describe "show" do
    before do
      @id = "test_project"
    end

    it "should render show" do
      get :show, :id => @id
      response.should render_template(:show)
    end

    it "should assign project" do
      @project = mock_model(Project)
      Project.should_receive(:find).with(:first, :conditions => {:key => @id}).and_return(@project)
      get :show, :id => @id
      assigns(:project).should == @project
    end
  end

end
