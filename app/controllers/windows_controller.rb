class WindowsController < ApplicationController

  before_action :authenticate_user!, only: [:show, :destroy]

  def index
    @windows = Window.all
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
