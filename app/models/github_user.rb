class GithubUser
  attr_reader :username, :image_url

  def initialize(attrs = {})
    @username = attrs[:login]
    @image_url = attrs[:avatar_url]
  end
end
