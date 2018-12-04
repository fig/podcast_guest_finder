class PodcastRSSFile
  def initialize(show:, contents:)
    @show = show
    @xml_doc = Nokogiri::XML(contents)
  end

  def consume!
    rss_feed_episodes.map do |rss_feed_episode|
      @show.episodes.create!(rss_feed_episode.attributes)
    end
  end

  private

  def rss_feed_episodes
    episode_elements.map do |episode_element|
      RSSFeedEpisode.new(episode_element)
    end
  end

  def episode_elements
    @xml_doc.xpath('//item')
  end
end
