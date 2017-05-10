class GithubService

  def initialize
    @conn = Faraday.new('https://api.github.com')
  end

  def starred_repos(username, filter)
    response = @conn.get("/users/#{username}/starred", filter)
    JSON.parse(response.body, symbolize_name: true)
  end

  def self.starred_repos(username, filter = {})
    service = GithubService.new
    service.starred_repos(username, filter)
  end

  def followers(username, filter)
    response = @conn.get("/users/#{username}/followers", filter)
    JSON.parse(response.body, symbolize_name: true)
  end

  def self.followers(username, filter = {})
    service = GithubService.new
    service.followers(username, filter)
  end

  def followings(username, filter)
    response = @conn.get("/users/#{username}/following", filter)
    JSON.parse(response.body, symbolize_name: true)
  end

  def self.followings(username, filter = {})
    service = GithubService.new
    service.followings(username, filter)
  end

end
