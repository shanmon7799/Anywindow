class WindowsController < ApplicationController

  before_action :authenticate_user!
  # root => random window
  def index

  end

  # search => keyword search window
  def search
    if params[:keyword] && params[:keyword] != ""
      @cities = City.where(name: params[:keyword])
    else
      @cities = City.all
    end
  end

  # search_result => search bar or image click
  def search_result
    @city = City.find(params[:id])
  end

  # map => map click window
  def map

  end

  def show
    @window = Window.find(params[:id])
    @window.increment!(:page_views, 1)
    @quote = Quote.order("RAND()").first
    @comment = Comment.new
    @comments = @window.comments
	end

	def destroy
		@comment.destroy
		redirect_to :back, alert: "刪除成功"
	end
end
