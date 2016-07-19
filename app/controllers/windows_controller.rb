class WindowsController < ApplicationController

  before_action :authenticate_user!

  def index
    @windows = Window.all

  end

  def show
    @window = Window.find(params[:id])
    @window.increment!(:page_views, 1)
	end
end
