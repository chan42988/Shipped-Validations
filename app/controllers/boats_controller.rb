class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
    @job = Job.new
    @jobs = Job.where(boat_id: params[:id])
  end

  def create
    @boat = Boat.new(boat_params)
    if @boat.save 
      flash[:notice] = "Your boat was created!"
      redirect_to boat_path(@boat)
    else
      flash[:alert] = "Problem creating your boat!"
      redirect_to '/'
    end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    if @boat.update(boat_params)
      flash[:notice] = "Boat updated successfully"
      redirect_to boat_path(@boat)
    else
      flash[:alert] = "Update failed"
      render :edit
    end
  end

  def destroy
    Job.where(boat_id: params[:id]).each do |job|
        job.delete
      end
    Boat.find(params[:id]).delete
    redirect_to boats_path
  end

  private   
  def boat_params
    params.require(:boat).permit(:name, :max_containers, :location, :user_id, :avatar)   
  end

end
