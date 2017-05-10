class GithubService

  def initialize
    @conn = Faraday.new('https://api.github.com')
  end

  def starred_repos(username)
    response = @conn.get("/users/#{username}/starred")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.starred_repos(username)
    service = GithubService.new
    service.starred_repos(username)
  end

  def followers(username)
    response = @conn.get("/users/#{username}/followers")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.followers(username)
    service = GithubService.new
    service.followers(username)
  end

  def followings(username)
    response = @conn.get("/users/#{username}/following")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.followings(username)
    service = GithubService.new
    service.followings(username)
  end

end
