class PersonMailer < ActionMailer::Base
  include SendGrid
  sendgrid_category :use_subject_lines

  default from: "do-not-respond@powerracingseries.org"

  def welcome_email(person)
    @person = person
    @url = "http://ppprs.herokuapp.com/account/sign_in"

    mail(:to => @person.email, :subject => "Welcome to Power Racing Series!")
  end

  def visibility_email(team)
    @team = team
    mail(:to => "joshsinbox@gmail.com", :subject => "Visibility Request: #{@team.name}")
  end

end
