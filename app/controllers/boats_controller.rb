class BoatsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @boat = Boat.new
  end

  def create
    if Boat.where(name: params[:boat][:name]) == nil
      @boat = Boat.new(name: params[:boat][:name], max_containers: params[:boat][:max_containers], location: params[:boat][:location], user_id: current_user.id)
      if @boat.save 
        flash[:notice] = "Your boat was created!"
        redirect_to boat_path(@boat)
      else
        flash[:alert] = "Problem creating your boat!"
        redirect_to :back
      end
    else
      flash[:alert] = "A boat with that name already exists"
        redirect_to :back
    end
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    @boat = Boat.find(params[:id])
    if Boat.where(name: params[:boat][:name]) == nil

      @boat.update(name: params[:boat][:name], max_containers: params[:boat][:max_containers], location: params[:boat][:location])
      redirect_to boat_path(@boat)

    elsif @boat.name == params[:boat][:name]

      @boat.update(max_containers: params[:boat][:max_containers], location: params[:boat][:location])
      redirect_to boat_path(@boat)

    else

      flash[:alert] = "Update failed"
        redirect_to :back

    end
  end

  def destroy
  end

end
