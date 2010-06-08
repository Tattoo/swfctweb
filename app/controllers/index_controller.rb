class IndexController < ApplicationController

  def show
    @active_projects = Project.active_projects
    @future_projects = Project.future_projects
  end

end