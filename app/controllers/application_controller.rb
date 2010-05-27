class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'

  before_filter :generate_slogan

  def generate_slogan
    @slogan_name = "slogans/slogan" + (1 + rand(14)).to_s + ".png"
  end
end
