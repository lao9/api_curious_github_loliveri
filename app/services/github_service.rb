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

end
