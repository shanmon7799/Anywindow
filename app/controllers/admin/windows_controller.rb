class Admin::WindowsController < ApplicationController
  layout "admin"
	before_action :authenticate

  before_action :set_window, only: [:show, :edit, :update, :destroy]

	def index
    if params[:keyword]
      @windows = Window.where( [ "name like ?", "%#{params[:keyword]}%" ] )
    else
      @windows = Window.all
    end

    @windows = @windows.page(params[:page]).per(10).order(id: :DESC)
	end

	def show
	end

	def new
		@window = Window.new
	  @city = City.new
    @countries = Country.all
  end

	def create
    @city = City.find_by_name(params[:city][:name])
    @window = @city.windows.create!(window_params)
    @window.latitude = params[:window][:locations].split(",").first
    @window.longitude = params[:window][:locations].split(",").last

    if @window.save
      if params[:provider_pic]
         @window.update!(provider_pic: params[:provider_pic])
      end

      if params[:videos]
        params[:videos].each { |video| @window.videos.create(video: video) }
      end

      if params[:images]
        params[:images].each { |image| @window.images.create(image: image) }
      end

      if params[:audios]
        params[:audios].each { |audio| @window.audios.create(audio: audio) }
      end

			redirect_to admin_windows_path, notice: "新增成功"
	  else
	    render :new
	  end
	end

	def edit
  end

	def update
    if  @window.update(window_params)

      @window.images.destroy_all  if params[:remove_images]
      @window.audios.destroy_all  if params[:remove_audios]
      @window.videos.destroy_all  if params[:remove_videos]

      if params[:images]
        params[:images].each do |image|
          unless @window.images.exists?(image)
            @window.images.create(image: image)
          end
        end
      end

      if params[:audios]
        params[:audios].each do |audios|
          unless @window.audios.exists?(audios)
            @window.audios.create(audio: audios)
          end
        end
      end

      if params[:videos]
        params[:videos].each do |video|
          unless @window.videos.exists?(video)
            @window.videos.create(video: video)
          end
        end
      end

			redirect_to admin_windows_path, alert: "更新成功"
		else
		  render :edit
		end
	end

	def destroy
		@window.destroy
		redirect_to admin_windows_path, alert: "刪除成功"
	end

  #Import CSV
  def import
    Country.import(params[:file])
    redirect_to admin_windows_path
  end

  protected

  def authenticate
     authenticate_or_request_with_http_basic do |user_name, password|
         user_name == "anywindow" && password == "anywindow"
     end
  end

  def set_window
    @window = Window.find(params[:id])
  end

  def window_params
  	params.require(:window).permit(:name, :keyword, :provider_name, :provider_service, :provider_url, :provider_pic)
  end
end
