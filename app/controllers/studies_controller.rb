class StudiesController < ApplicationController
  def index
    @studies = Study.all
  end

  def show
    @study = Study.find(:first, :conditions => {:key => params[:id]})
    redirect_to root_path unless @study
  end
end