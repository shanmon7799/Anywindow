class WindowsController < ApplicationController

  before_action :authenticate_user!
  def index
    @window = Window.where(name: "JR西日本宮島渡輪" ).first
  end

  def random
    if params[:city_id]
      city = City.find(params[:city_id])
      @window = city.windows.sample(1)
    else
      @window = Window.all.sample(1).first
    end
    redirect_to window_path(@window)
  end

  # map => map click window
  def map

  end

  # search => keyword search window
  def search
    if params[:keyword] && params[:keyword] != ""
      @cities = City.where(name: params[:keyword])
    else
      @cities = City.all.order("id DESC")
    end
  end

  # search_result => search bar or image click
  def city_detail
    @city = City.find(params[:id])
  end

  def window_detail
    @window = Window.find(params[:id])
    @comments = @window.comments.includes(:user).order(updated_at: :desc)
    @comment = Comment.new
  end

  def show
    @window = Window.find(params[:id])
    @quote = Quote.order("RAND()").first
	end
end
