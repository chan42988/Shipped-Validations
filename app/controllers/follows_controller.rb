class FollowsController < ApplicationController
	def create
		Follow.create(user_id: current_user.id, boat_id: params[:follow][:boat_id])
	end

	def destroy
		Follow.where(user_id: current_user.id, boat_id: params[:id]).delete
	end
end