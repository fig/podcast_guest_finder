class RSSFeedEpisode
  def initialize(element)
    @element = element
  end

  def attributes
    {
      name:        content('title'),
      link:        content('link'),
      description: content('description')
    }
  end

  private

  def content(tag)
    @element.css(tag).first.content.strip
  end
end
