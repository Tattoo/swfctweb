class Admin::TextFragmentsController < Admin::AdminController

  def index
    @text_fragments = TextFragment.all
  end

  def edit
    @text_fragment = TextFragment.find(params[:id])
  end

  def update
    @text_fragment = TextFragment.find(params[:id])
    @text_fragment.value = params[:text_fragment][:value]
    if @text_fragment.save
      flash[:notice] = "Saved!"
      redirect_to admin_text_fragments_path
    else
      flash[:error] = "Errors!"
      render :edit
    end
  end

end