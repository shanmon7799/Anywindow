class CommentsController < ApplicationController
	before_action :set_window , only: [:new, :create, :destroy]
  before_action :authenticate_user!

	def new
		@comment = @window.comments.new
	end

	def create
		@comment = @window.comments.build(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		redirect_to :back
	end

	def destroy
		@comment = @window.comments.find(params[:id])
		@comment.destroy
		redirect_to :back, alert: "刪除成功"
	end

	protected

	def comment_params
		params.require(:comment).permit(:content)
	end

	def set_window
    @window = Window.find(params[:window_id])
  end

end
