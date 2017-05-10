class FollowersController < ApplicationController

  def index
    @github_users = current_user.followers
  end

end
