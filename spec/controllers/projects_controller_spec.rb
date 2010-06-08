require 'spec_helper'

describe ProjectsController do

  describe "index" do
    it "should render index" do
      get :index
      response.should render_template(:index)
    end

    it "should assign past projects" do
      @p = mock(Array)
      Project.should_receive(:past_projects).and_return(@p)
      get :index
      assigns(:past_projects).should == @p
    end

    it "should assign active projects" do
      @p = mock(Array)
      Project.should_receive(:active_projects).and_return(@p)
      get :index
      assigns(:active_projects).should == @p
    end

    it "should assign future projects" do
      @p = mock(Array)
      Project.should_receive(:future_projects).and_return(@p)
      get :index
      assigns(:future_projects).should == @p
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
