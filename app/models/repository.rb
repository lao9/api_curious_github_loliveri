class Repository
  include ActionView::Helpers::DateHelper
  attr_reader :full_name, :language

  def initialize(attrs = {})
    @full_name = attrs["full_name"]
    @language = attrs["language"]
    @updated_at = attrs["updated_at"]
  end

  def format_date
    distance_of_time_in_words_to_now(updated_at.to_datetime)
  end

  private
    attr_reader :updated_at

end
