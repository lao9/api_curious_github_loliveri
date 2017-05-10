# class GitHubService
#
#   def initialize
#     @conn = Faraday.new("https://api.github.com/users")
#   end
#
#   def starred_repos(filter)
#     response = @conn.get("/#{current_user.username}/starred", filter)
#
#     JSON.parse(response.body, symbolize_name: true)
#   end
#
#   def self.starred_repos(filter = {})
#     service = GithubService.new
#     service.starred_repos(filter)
#   end
#
# end
