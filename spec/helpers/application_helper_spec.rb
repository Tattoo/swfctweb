require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationHelper do
  describe "email link" do
    before do
      @email = "myname@lastname.com"
      @text = "Test Name"
      @result = helper.email_link(@email, @text)
    end

    it "should not contain @" do
      @result.should_not include("@")
    end

    it "should contain @-replaced address in rel field" do
      @result.should match(/<a.*rel='myname\(replace at\)lastname.com'.*>.*<\/a>/)
    end

    it "should contain email class" do
      @result.should match(/<a.*class='email'.*>.*<\/a>/)
    end

    it "should not contain href attribute" do
      @result.should_not contain("href")
    end

    it "should contain the text inside of a tag" do
      @result.should match(/<a.*>Test Name<\/a>/)
    end
  end
end