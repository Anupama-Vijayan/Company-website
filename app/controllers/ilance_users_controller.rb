class IlanceUsersController < ApplicationController

	def new

	end

	def create
		@user = IlanceUser.new(user_params)
		if @user.save
			flash[:notice] = "Welcome to the site!"
			redirect_to log_in_path
		else
			flash[:alert] = "There was a problem creating your account. Please try again."
			redirect_to :back		
		end
	end

	private
	def user_params
		params.require(:ilance_user).permit(:username, :pass_key, :pass_key_confirmation)
	end
end
