class FollowingsController < ApplicationController

  def index
    @github_users = current_user.followings
  end

end
