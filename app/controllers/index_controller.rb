class IndexController < ApplicationController

  def show
    @active_projects = Project.active_projects
  end

end