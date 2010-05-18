require 'spec_helper'

describe ProjectsController do

  describe "GET 'gnobles'" do
    it "should be successful" do
      get 'gnobles'
      response.should be_success
    end
  end

  describe "GET 'yfactor'" do
    it "should be successful" do
      get 'yfactor'
      response.should be_success
    end
  end

  describe "GET 'planesweep'" do
    it "should be successful" do
      get 'planesweep'
      response.should be_success
    end
  end

end
