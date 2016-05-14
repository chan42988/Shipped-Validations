class FollowsController < ApplicationController

	def create
		@follow = Follow.new(user_id: current_user.id, boat_id: params[:follow][:boat_id])

		respond_to do |format|
			if @follow.save
				# format.html { redirect_to :back }
				# format.json { render :show, status: :created, location: @follow }
				format.js
			else
				format.html { render :new }
				format.json { render json: @follow.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		# Follow.where(user_id: current_user.id, boat_id: params[:follow][:boat_id]).delete
		@follow = Follow.find(params[:id])
		@follow.destroy
		respond_to do |format|
			# format.html { redirect_to :back, notice: 'You are not following this boat anymore.'}
			# format.json { head :no_content }
			format.js
		end 
	end
end