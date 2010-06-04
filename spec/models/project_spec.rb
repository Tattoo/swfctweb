require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Project do
  before(:each) do
    @valid_attrs = {
      :key => "test_project",
      :name => "Test project",
      :starts_at => "2010-01-01",
      :ends_at => "2010-03-31"
    }
    @project = Project.new(@valid_attrs)
  end

  it "should save with valid attributes" do
    @project.should be_valid
    Project.create!(@valid_attrs)
  end

  describe "validation" do
    it "should require key" do
      @project.key = ""
      @project.should_not be_valid
    end

    it "should require name" do
      @project.name = ""
      @project.should_not be_valid
    end

    it "should require starts_at" do
      @project.starts_at = ""
      @project.should_not be_valid
    end

    it "should require ends_at" do
      @project.ends_at = ""
      @project.should_not be_valid
    end

    it "should require that dates are in proper order" do
      @project.starts_at = "2010-04-02"
      @project.ends_at = "2010-04-01"
      @project.should_not be_valid
    end

    it "should prevent one day project" do
      @project.starts_at = "2010-04-02"
      @project.ends_at = "2010-04-02"
      @project.should_not be_valid
    end
  end

  describe "active" do
    it "is active when start date is today" do
      @project.starts_at = Date.today
      @project.ends_at = Date.today + 1
      @project.should be_active
    end

    it "is active when end date is today" do
      @project.starts_at = Date.today - 1
      @project.ends_at = Date.today
      @project.should be_active
    end

    it "is not active when start date is in future" do
      @project.starts_at = Date.today + 1
      @project.ends_at = Date.today + 2
      @project.should_not be_active
    end

    it "is not active when end date is in past" do
      @project.starts_at = Date.today - 2
      @project.ends_at = Date.today - 1
      @project.should_not be_active
    end
  end

  describe "active_project" do
    describe "no active projects" do
      before do
        Project.destroy_all
      end

      it "should return nil" do
        Project.active_project.should == nil
      end
    end

    # currently assumed that only one active project at a time (will change at least in Global SF)
    describe "active project" do
      before do
        @valid_attrs[:name] = "Old project"
        @valid_attrs[:starts_at] = Date.today - 20
        @valid_attrs[:ends_at] = Date.today - 10
        @old = Project.create(@valid_attrs)

        @valid_attrs[:name] = "Active project"
        @valid_attrs[:starts_at] = Date.today - 5
        @valid_attrs[:ends_at] = Date.today + 10
        @active = Project.create(@valid_attrs)

        @valid_attrs[:name] = "Future project"
        @valid_attrs[:starts_at] = Date.today + 20
        @valid_attrs[:ends_at] = Date.today + 30
        @future = Project.create(@valid_attrs)
      end

      it "should return the active project" do
        Project.active_project.name.should == "Active project"
      end
    end
  end
end

