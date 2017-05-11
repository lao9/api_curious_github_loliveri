class FollowingCommitsController < ApplicationController

  def index
    @commits = current_user.following_commits.take(20)
  end

end
