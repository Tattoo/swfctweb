class Admin::AdminController < ApplicationController
  before_filter :authenticate

  protected

  def authenticate
    authenticate_or_request_with_http_basic('admin') do |username, password|
        username == get_username && password == get_password
    end
  end

  def get_username
    if ENV['RAILS_ENV'] == 'production'
      'swfctadmin'
    else
      'admin'
    end
  end

  def get_password
    if ENV['RAILS_ENV'] == 'production'
      'SoftwareFactory2010-2013'
    else
      'admin'
    end
  end
end