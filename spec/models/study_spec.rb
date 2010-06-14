require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Study do
  before(:each) do
    @valid_attrs = {
      :key => "test_study",
      :title => "Test study",
      :researchers => "PhD Test Guy, MSc Test Lady",
      :contact_email => "test@study.com"
    }
    @study = Study.new(@valid_attrs)
  end

  it "should save with valid attributes" do
    Study.create!(@valid_attrs)
  end

  describe "validation" do
    it "should be valid with valid attributes" do
      @study.should be_valid
    end

    it "should require key" do
      @study.key = ""
      @study.should_not be_valid
    end

    it "should require title" do
      @study.title = ""
      @study.should_not be_valid
    end

    it "should require researchers" do
      @study.researchers = ""
      @study.should_not be_valid
    end

    it "should require contact email" do
      @study.contact_email = ""
      @study.should_not be_valid
    end
  end

  describe "projects" do
    describe "none" do
      @study = Study.new()
      @study.projects.should == []
    end

    describe "exists" do
      before do
        Project.create!(:key => "project1", :name => "name1", :starts_at => Date.today, :ends_at => Date.today + 1)
        Project.create!(:key => "project2", :name => "name2", :starts_at => Date.today, :ends_at => Date.today + 1)
        @study.project_keys = ["project1", "project2"]
      end

      it "should have many projects" do
        @study.project_keys[0].should == "project1"
        @study.project_keys[1].should == "project2"
      end

      it "should have many projects" do
        projects = @study.projects
        projects.length.should == 2
        projects[0].name.should == "name1"
        projects[1].name.should == "name2"
      end
    end
  end
end

