require 'spec_helper'

describe StaticsController do

  it "#education" do
    get :education
    response.should render_template(:education)
  end

  it "#guide" do
    get :guide
    response.should render_template(:guide)
  end

  describe "entrepreneurship" do
    it "should render entrepreneurship" do
      get :entrepreneurship
      response.should render_template(:entrepreneurship)
    end
  end

end
