class StaticsController < ApplicationController

  def index
  end

  def education
  end

  def research
  end

  def entrepreneurship
  end

  def projects
  end

  def contact
  end

  def post_contact
    raise params.inspect
    redirect_to contact_path
  end


  def vision
  end
end
