class ReposController < ApplicationController

  def index
    @repos = current_user.repos
  end

end
