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

  describe "upcoming" do
    it "is not upcoming when start date is today" do
      @project.starts_at = Date.today
      @project.ends_at = Date.today + 1
      @project.should_not be_upcoming
    end

    it "is not upcoming when start date is in past" do
      @project.starts_at = Date.today - 2
      @project.ends_at = Date.today - 1
      @project.should_not be_upcoming
    end

    it "is upcoming when start date is in future" do
      @project.starts_at = Date.today + 1
      @project.ends_at = Date.today + 2
      @project.should be_upcoming
    end
  end

  describe "projects based on time" do
    describe "no projects" do
      before do
        Project.destroy_all #TODO: why is this needed?
      end

      it "past projects should be empty" do
        Project.past_projects.should be_empty
      end

      it "active projects should be empty" do
        Project.active_projects.should be_empty
      end

      it "future projects should be empty" do
        Project.future_projects.should be_empty
      end
    end

    describe "project timing" do
      before do
        Project.destroy_all #TODO: why is this needed?
        @attrs = @valid_attrs

        @attrs[:key] = "Future project 2"
        @attrs[:starts_at] = Date.today + 120
        @attrs[:ends_at] = Date.today + 130
        @future2 = Project.create(@attrs)

        @attrs[:key] = "Old project 2"
        @attrs[:starts_at] = Date.today - 40
        @attrs[:ends_at] = Date.today - 1
        @old2 = Project.create(@attrs)

        @attrs[:key] = "Active project 2"
        @attrs[:starts_at] = Date.today - 15
        @attrs[:ends_at] = Date.today + 20
        @active2 = Project.create(@attrs)

        @attrs[:key] = "Old project 1"
        @attrs[:starts_at] = Date.today - 120
        @attrs[:ends_at] = Date.today - 110
        @old1 = Project.create(@attrs)

        @attrs[:key] = "Future project 1"
        @attrs[:starts_at] = Date.today + 1
        @attrs[:ends_at] = Date.today + 30
        @future1 = Project.create(@attrs)

        @attrs[:key] = "Active project 1"
        @attrs[:starts_at] = Date.today - 25
        @attrs[:ends_at] = Date.today + 10
        @active1 = Project.create(@attrs)
      end

      it "past" do
        p = Project.past_projects
        p[0].key.should == @old2.key #notice the order
        p[1].key.should == @old1.key
      end

      it "active" do
        p = Project.active_projects
        p[0].key.should == @active1.key
        p[1].key.should == @active2.key
      end

      it "future" do
        p = Project.future_projects
        p[0].key.should == @future1.key
        p[1].key.should == @future2.key
      end

      describe "previous" do
        it "returns nil when the first project" do
          @old1.previous.should == nil
        end

        it "return previous project if this is not the first one" do
          @future2.previous.key.should == @future1.key
          @future1.previous.key.should == @active2.key
          @active2.previous.key.should == @active1.key
          @active1.previous.key.should == @old2.key
          @old2.previous.key.should == @old1.key
        end
      end

      describe "next" do
        it "returns nil when the last project" do
          @future2.next.should == nil
        end

        it "return next project if this is not the last one" do
          @old1.next.key.should == @old2.key
          @old2.next.key.should == @active1.key
          @active1.next.key.should == @active2.key
          @active2.next.key.should == @future1.key
          @future1.next.key.should == @future2.key
        end
      end
    end
  end

  describe "studies" do
    describe "none" do
      @project = Project.new()
      @project.studies.should == []
    end

    describe "exists" do
      before do
        Study.create!(:key => "study1", :title => "title1", :researchers => "res1", :contact_email => "test@study.com", :contact_text => "Some Guy")
        Study.create!(:key => "study2", :title => "title2", :researchers => "res2", :contact_email => "test@study.com", :contact_text => "Some Guy")
        @project.study_keys = ["study1", "study2"]
      end

      it "should have many study keys" do
        @project.study_keys[0].should == "study1"
        @project.study_keys[1].should == "study2"
      end

      it "should have many studies" do
        studies = @project.studies
        studies.length.should == 2
        studies[0].title.should == "title1"
        studies[1].title.should == "title2"
      end
    end
  end
end

