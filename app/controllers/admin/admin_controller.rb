class Admin::AdminController < ApplicationController
  before_filter :authenticate

  protected

  def authenticate
    authenticate_or_request_with_http_basic('admin') do |username, password|
        username == 'admin' && password == 'admin' #TODO: ENV
    end
  end
end