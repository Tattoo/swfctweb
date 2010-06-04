require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Admin::TextFragmentsController do
  before do
    controller.stub!(:authenticate)
  end

  describe "#index" do
    before do
      @all_tf = mock(Array)
      TextFragment.should_receive(:all).and_return(@all_tf)
      get :index
    end

    it "should assign @text_fragments" do
      assigns(:text_fragments).should == @all_tf
    end

    it "should render index" do
      response.should render_template('index')
    end
  end

  describe "#edit" do
    before do
      @tf = mock_model(TextFragment)
      @id = 1
      TextFragment.should_receive(:find).with(@id).and_return(@tf)
      get :edit, :id => @id
    end

    it "should assign @text_fragment" do
      assigns(:text_fragment).should == @tf
    end

    it "should render edit" do
      response.should render_template('edit')
    end
  end

  describe "#update" do
    before do
      @tf = mock_model(TextFragment)
      @id = "id"
      @key = "x"
      @value = "y"
      TextFragment.should_receive(:find).with(@id).and_return(@tf)
      @tf.should_receive('value=').with(@value)
      @tf.should_not_receive('key=').with(@key)
    end

    it "should redirect to index when save succeeds" do
      @tf.should_receive(:save).and_return(true)
      post :update, :id => @id, :text_fragment => {:key => @key, :value => @value}
      response.should redirect_to(admin_text_fragments_path)
    end

    it "should render edit when save does not succeed" do
      @tf.should_receive(:save).and_return(false)
      post :update, :id => @id, :text_fragment => {:key => @key, :value => @value}
      response.should render_template(:edit)
    end
  end
end

