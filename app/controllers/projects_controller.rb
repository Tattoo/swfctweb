class ProjectsController < ApplicationController
  def index
  end

  def show
    @project = Project.find(:first, :conditions => {:key => params[:id]})
  end

end
