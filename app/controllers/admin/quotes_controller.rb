class Admin::QuotesController < ApplicationController

	before_action :set_quote, only: [:edit, :update, :destroy]

	def index
		@quotes = Quote.all
	end

	def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
    	 redirect_to admin_quotes_path, alert: "新增成功"
  		else
  			render :new
  	end
  end

  def edit
  end

  def update
  	if  @quote.update(quote_params)
  		redirect_to admin_quotes_path, alert: "更新成功"
		else
		  render :edit
		end
  end

  def destroy
  	@quote.destroy
  	redirect_to admin_quotes_path, alert: "刪除成功"
  end

	protected

	def quote_params
    params.require(:quote).permit(:content)
  end

	def set_quote
    @quote = Quote.find(params[:id])
  end
end
