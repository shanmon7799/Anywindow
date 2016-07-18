# app/controllers/api_v1/windows_controller.rb
class ApiV1::WindowsController < ApiController

  #before_action :authenticate_user!

  # GET /api/v1/windows
  def index
    @countries = Country.all

    #index.json.jbuilder
  end

  # /api/v1/windows/:id
  def show
    window = Window.find(params[:id])
    #UseRecord.create!(window: window, user: current_user)

    render json: {message: "OK"} if window
  end

  def update
    window = Window.find(params[:id])
    #use_record = UseRecord.where(window: window, user: current_user)..order("created_at desc").first

    # if params[:is_broken]
    #   use_record.params = true
    #   if use_record.save
    #     render json: {message: "OK"}
    #   else
    #     render json: {message: "Invalid" }, status: 400
    #   end
    # end
    if params[:is_broken]
      render json: {message: "OK"}
    else
      render json: {message: "Invalid"},status:400
    end
  end
end
