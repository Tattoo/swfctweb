require 'spec_helper'

describe StaticsController do

  it "should render #education" do
    get :education
  end

  it "#guide" do
    get :guide
    response.should render_template(:guide)
  end

end
