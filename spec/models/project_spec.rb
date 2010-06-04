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
  end
end

