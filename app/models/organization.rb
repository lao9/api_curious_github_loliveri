class Organization
  attr_reader :title, :image_url

  def initialize(attrs = {})
    @title = attrs[:login]
    @image_url = attrs[:avatar_url]
  end

end
