class IndexController < ApplicationController

  def show
    @active_project = Project.active_project
  end

end