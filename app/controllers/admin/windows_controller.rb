class Admin::WindowsController < ApplicationController

	before_action :authenticate

	def index

	end


  protected

  def authenticate
     authenticate_or_request_with_http_basic do |user_name, password|
         user_name == "anywindow" && password == "anywindow"
     end
  end

end
