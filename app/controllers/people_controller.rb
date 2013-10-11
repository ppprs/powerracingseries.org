class PeopleController < ApplicationController
  before_filter :authenticate_person!

  def index
    @people = current_person.team.people
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(params[:person])
    @person.team = current_person.team
    @person.password = (0...8).map{65.+(rand(26)).chr}.join

    if @person.save
      flash[:notice] = "Successfully added '#{@person.first_name}' to your team!"
      redirect_to my_team_url
    else
      render action: "new"
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if @person.update_without_password(params[:person])
      redirect_to my_team_url
    else
      logger.info @person.errors.inspect
      render action: "edit"
    end
  end

  def destroy
  end
end
