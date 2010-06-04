class ProjectsController < ApplicationController

  def index
    @past_projects = Project.past_projects
    @active_projects = Project.active_projects
    @future_projects = Project.future_projects
  end

  def show
    @project = Project.find(:first, :conditions => {:key => params[:id]})
  end

end
