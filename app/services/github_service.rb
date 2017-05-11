class GithubService

  def initialize
    @conn = Faraday.new('https://api.github.com')
  end

  def starred_repos(username, filters)
    response = @conn.get("/users/#{username}/starred", filters)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.starred_repos(username, filters = {})
    service = GithubService.new
    service.starred_repos(username, filters)
  end

  def followers(username, filters)
    response = @conn.get("/users/#{username}/followers", filters)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.followers(username, filters = {})
    service = GithubService.new
    service.followers(username, filters)
  end

  def followings(username, filters)
    response = @conn.get("/users/#{username}/following", filters)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.followings(username, filters = {})
    service = GithubService.new
    service.followings(username, filters)
  end

  def repos(username, filters)
    response = @conn.get("/users/#{username}/repos", filters)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.repos(username, filters = {})
    service = GithubService.new
    service.repos(username, filters)
  end

  def orgs(username, filters)
    response = @conn.get("/users/#{username}/orgs", filters)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.orgs(username, filters = {})
    service = GithubService.new
    service.orgs(username, filters)
  end

  def commits(username, repo, filters)
    response = @conn.get("/repos/#{username}/#{repo}/commits", filters)
    raw_commits = JSON.parse(response.body, symbolize_names: true)
    raw_commits.map do |raw_commit|
      Commit.new(filters[:author], repo, raw_commit) if raw_commit.is_a?(Hash)
    end
  end

  def self.commits(username, filters = {})
    # all recent commits by a specific user
    service = GithubService.new
    # all repos that a user is a part of
    all_repos = service.repos(username, filters)
    # all commits for that user
    filters.merge!({author: username})
    filters.delete(:type)
    all_commits = all_repos.map do |repo|
      service.commits(repo[:owner][:login], repo[:name], filters)
    end
    all_commits.flatten.compact.sort_by {|commit| commit.created_at}.reverse
  end

  def self.following_commits(username, filters = {})
    service = GithubService.new
    # gather all a user's followers
    all_followings = service.followings(username, filters)
    # gather all commits by each follower
    filters.merge!({type: 'all'})
    all_commits = all_followings.map do |following|
      GithubService.commits(following[:login], filters)
    end
    all_commits.flatten.compact.sort_by {|commit| commit.created_at}.reverse
  end

end
