class RSSFeedEpisode
  def initialize(element)
    @element = element
  end

  def attributes
    {
      name:        content('title'),
      link:        content('link'),
      description: content('description'),
      show_notes:  content('content|encoded')
    }
  end

  def content(tag)
    sub_element = @element.css(tag).first
    return '' unless sub_element.present?
    sub_element.content.strip
  end
end
