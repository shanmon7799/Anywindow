class Admin::WindowsController < ApplicationController

	before_action :authenticate

	def index
		@windows = Window.all
	end

	def show
		@window = Window.find(params[:id])
	end

	def new
		@window = Window.new
		@city = City.new
		@country = Country.new
	end

	def create
		@window = Window.new(window_params)
		@city = City.new(city_params)
		@country = Country.new(country_params)
		if @country.save
			@city.country_id = @country.id
			@city.save
			@window.city_id = @city.id
			@window.save
			redirect_to admin_windows_path, alert: "新增成功"
	  else
	    render :new
	  end
	end

	def edit
		@window =Window.find(params[:id])
		@city = @window.city
		@country = @city.country
	end

	def update
		@window = Window.find(params[:id])
		@city = @window.city
		@country = @city.country
			if
				@window.update(window_params)
				@city.update(city_params)
				@country.update(country_params)
				redirect_to admin_windows_path, alert: "更新成功"
		  	  else
		       render :edit
			end
	end

	def destroy
		@window = Window.find(params[:id])
		@window.destroy
		redirect_to admin_windows_path, alert: "刪除成功"
	end

  protected

  def authenticate
     authenticate_or_request_with_http_basic do |user_name, password|
         user_name == "anywindow" && password == "anywindow"
     end
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
end
