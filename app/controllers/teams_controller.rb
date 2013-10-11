class TeamsController < ApplicationController
  before_filter :authenticate_person!, :only => [:edit, :update]

  def index
    @teams = Team.visible
  end

  def past
    render
  end

  def show

    if params[:id].nil? && params[:slug].nil?
      authenticate_person!
    end

    @team = if (params[:id].nil? && params[:slug].nil?) && person_signed_in?
              current_person.team
            else
              Team.find_by_slug(params[:slug].to_s)
            end

    redirect_to teams_url if @team.nil?
  end

  def edit
    if params[:id] && current_person.is_admin
      @team = Team.find_by_slug(params[:id])
    end
    @team ||= current_person.team
  end

  def visibility_request
    @team = current_person.team

    begin
      PersonMailer.visibility_email(@team).deliver
    rescue
      logger.error "Email failed?"
    end

    flash[:notice] = "Thanks! Your request has been sent."


    redirect_to my_team_url
  end

  def update
    if params[:id] && current_person.is_admin
      @team = Team.find_by_slug(params[:id])
    end
    @team ||= current_person.team

    if @team.update_attributes(params[:team])
      if params[:team][:image].present?
        render :crop
      else
        redirect_to my_team_url
      end
    else
      render action: "edit"
    end
  end
end
