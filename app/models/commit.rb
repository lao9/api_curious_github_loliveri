class Commit
  include ActionView::Helpers::DateHelper
  attr_reader :author_username, :author_name, :message, :repo, :created_at

  def initialize(username, repo, attrs = {})
    @author_username = username
    @author_name = attrs[:commit][:author][:name]
    @message = attrs[:commit][:message]
    @repo = repo
    @created_at = attrs[:commit][:author][:date].to_datetime
  end

  def format_date
    created_at.strftime("%I:%M %p %B %d, %Y")
  end

end
