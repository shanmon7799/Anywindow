class Admin::WindowsController < ApplicationController

	before_action :authenticate

  before_action :set_window, only: [:show, :edit, :update, :destroy]

	def index
		@windows = Window.all
	end

	def show
	end

	def new
		@window = Window.new
		@city = City.new
		@country = Country.new
	end

	def create
    create_new_window
		if @window.save
      if params[:videos]
        params[:videos].each { |video| @window.videos.create(video_file_name: video) }
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
      @window.videos.destroy_all  if params[:videos]

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
            @window.videos.create(video_file_name: video)
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
  	params.require(:window).permit(:name)
  end

  def city_params
  	params.require(:city).permit(:name)
  end

  def country_params
  	params.require(:country).permit(:name)
  end

  def create_new_window
    @country = Country.where(country_params).first
    @city = City.where(city_params).first
    if @city
      @window = @city.windows.build(window_params)
    elsif @country
      @city = @country.cities.create!(city_params)
      @window = @city.windows.build(window_params)
    else
      @country = Country.create!(country_params)
      @city = @country.cities.create!(city_params)
      @window = @city.windows.build(window_params)
    end
  end
end
