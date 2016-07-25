# app/controllers/api_v1/comments_controller.rb
class ApiV1::CommentsController < ApiController

  before_action :authenticate_user!
  before_action :set_window

  # GET /api/v1/windows/:window_id/comments
  def index
    @comments = @window.comments
  end

  # POST /api/v1/windows/:window_id/comments
  def create
    @comment = @window.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      render json: {message: "OK", comment_id: @comment}
    else
      render json: {message: "Invalid" }, status: 400
    end
  end

  # PATCH /api/v1/windows/:window_id/comments/:id
  def update
    @comment = @window.comments.find(params[:id])
    if @comment.update(comment_params)
      render json: {message: "OK"}
    else
      render json: {message: "Invalid" }, status: 400
    end
  end

  # DELETE /api/v1/windows/:window_id/comments/:id
  def destroy
    @comment = @window.comments.find(params[:id])
    @comment.destroy
    render json: {message: "OK"}
  end

  private

  def set_window
    @window = Window.find(params[:window_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
