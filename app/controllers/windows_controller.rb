class WindowsController < ApplicationController

  before_action :authenticate_user!

  def index

  end

  def show
    @window = Window.find(params[:id])
    @window.pages_count +=1
    @window.save
	end
end
