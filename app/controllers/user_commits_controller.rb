class UserCommitsController < ApplicationController

  def index
    @commits = current_user.commits.take(20)
  end

end
