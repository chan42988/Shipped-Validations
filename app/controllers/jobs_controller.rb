class JobsController < ApplicationController

  def show
    @job = Job.find(params[:id])

  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:notice] = "Job has been created."
      redirect_to job_path(@job)
    else
      flash[:alert] = "problem!!! try again."
      redirect_to :back
    end
  end

  def edit
    @job = Job.find(params[:id])
    @boat = @job.boat
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      flash[:notice] = "Your boat is updated."
      redirect_to job_path(@job)
    else
      flash[:alert] = "There is a problem updating your boat."
      render :edit
    end

  end

  def destroy
    @job = Job.find(params[:id])
    @boat = @job.boat
    @job.delete
    redirect_to boat_path(@boat)
  end

  private
  def job_params
    params.require(:job).permit(:name, :destination, :origin, :cargo, :containers_needed, :cost, :boat_id, :user_id)
  end 
end
