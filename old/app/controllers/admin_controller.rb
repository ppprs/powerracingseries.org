class AdminController < ApplicationController

  before_filter :authenticate_person!
  before_filter :authenticate_admin!

  def index
    @teams = Team.all
  end
end
