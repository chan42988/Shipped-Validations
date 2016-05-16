class FollowsController < ApplicationController

	def create
		@follow = Follow.new(user_id: current_user.id, boat_id: params[:boat_id])

		respond_to do |format|
			if @follow.save
				format.js
			else
				format.html { render :new }
			end
		end
	end

	def destroy
		@follow = Follow.find(params[:id])
		@boat = Boat.find(@follow.boat_id)
		@follow.destroy
		respond_to do |format|
			format.js
		end 
	end
end