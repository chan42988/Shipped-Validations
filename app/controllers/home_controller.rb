class HomeController < ApplicationController
	def show
		if !current_user
			redirect_to new_user_registration_path
		end
		@user = User.find(current_user.id)
		@boat = Boat.new
		@boats = Boat.where(user_id: current_user.id)
	end
end