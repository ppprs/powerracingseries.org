class RegisterController < ApplicationController
  def new
    if person_signed_in?
      flash[:notice] = "You are already registered, bub."
      redirect_to my_team_url
    end
    @team = Team.new
    @captain = Person.new
  end

  def create

    @team = if session[:team_id]
              Team.find(session[:team_id])
            else
              Team.new(params[:team])
            end
    @captain = Person.new(params[:person]) 

    if session[:team_id] or @team.save
      session[:team_id] ||= @team.id

      @captain.team = @team
#      @captain.is_admin = true

      if @captain.save
        session[:captain_id] = @captain.id
      else
        logger.info "DID NOT SAVE THE CAPTAIN"
        logger.info @captain.inspect
        logger.info @captain.errors
      end
    end

    if session[:team_id] && session[:captain_id]
      # LOG IN AND REDIRECT
      begin
        logger.info "Sending welcome email for #{@captain.email}"
        PersonMailer.welcome_email(@captain).deliver
      rescue
        logger.error "Email failed? (#{@captain.email})"
      end

      sign_in @captain
      flash[:notice] = "Congrats! You now have an approximate 4% chance of glory on the battlefield!"
      redirect_to my_team_url
    else
      logger.info "rendering template: new cause error i guess"
      render action: "new"
    end
  end

end
