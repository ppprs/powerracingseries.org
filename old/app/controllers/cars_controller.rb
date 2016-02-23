class CarsController < ApplicationController
  before_filter :authenticate_person!

  def index
    @cars = current_person.team.cars
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(params[:car])
    @car.team = current_person.team

    if @car.save
      flash[:notice] = "Successfully added '#{@car.name}' to your team!"
      redirect_to my_team_url
    else
      render action: "new"
    end
  end

  def show
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])

    if @car.update_attributes(params[:car])
      redirect_to my_team_url
    else
      render action: "edit"
    end
  end

  def destroy
  end
end
