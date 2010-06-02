require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Admin::TextFragmentsController do
  it "#index" do
    response.should render_template :index
  end
end

