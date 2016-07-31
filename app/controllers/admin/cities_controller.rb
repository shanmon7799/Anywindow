class Admin::CitiesController < ApplicationController
	layout "admin"
	before_action :set_city, only: [:show, :edit, :update, :destroy]
	def index

	end

	def new
		@countries = Country.all
		@city = City.new
	end

	def create
		@country = Country.find_by_name(params[:country][:name])
		@city = @country.cities.build(city_params)

		if 	@city.save
			@city.update!(latitude: params[:city][:location].split(",").first)
    	@city.update!(longitude: params[:city][:location].split(",").last)

    	if params[:city_images]
      	@city.update!(image: params[:city_images])
    	end

			redirect_to admin_windows_path, notice: "新增成功"
	  else
	   	render :new
		end
	end

	def edit
	end

	def update
		if @city.update(city_params)

	    if params[:remove_city_images] == "1"
	      @city.image = nil
	      @city.save
	    end

	    if params[:city_images]
	      params[:city_images].each do |image|
	        unless @city.image.exists?
	          @city.update!(image: image)
	        end
	      end
	    end
			redirect_to admin_windows_path, alert: "更新成功"
		else
		  render :edit
		end
	end

	protected

	def set_city
		@city = City.find(params[:id])
	end

	def city_params
  	params.require(:city).permit(:name)
  end

end
