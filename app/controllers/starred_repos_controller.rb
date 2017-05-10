class StarredReposController < ApplicationController

  def index
    @repos = current_user.starred_repos
  end

end
