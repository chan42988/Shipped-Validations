class HomeController < ApplicationController
	def show
		@user = User.find(current_user.id)
		@boat = Boat.new
		@boats = Boat.where(user_id: current_user.id)
		@follows = Follow.where(user_id: current_user.id)
	end
end