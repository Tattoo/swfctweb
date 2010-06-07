class StudiesController < ApplicationController
  def show
    @study = Study.find(:first, :conditions => {:key => params[:id]})
    redirect_to root_path unless @study
  end
end