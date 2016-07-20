class Admin::UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update!(role: params[:admin])

		redirect_to admin_user_path(@user)
	end

end
