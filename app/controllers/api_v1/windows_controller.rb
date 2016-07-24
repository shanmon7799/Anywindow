# app/controllers/api_v1/windows_controller.rb
class ApiV1::WindowsController < ApiController

  #before_action :authenticate_user!

  # GET /api/v1/windows
  def index
    @countries = Country.all
    @quote = Quote.order("RAND()").first
    #index.json.jbuilder
  end

  # /api/v1/windows/:id
  def show
    window = Window.find(params[:id])
    @comments = @window.comments
  end

  def update
    window = Window.find(params[:id])
  end
end
