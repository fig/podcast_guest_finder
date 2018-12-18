class RSSFeedEpisodeTestFactory
  def self.create(inner_contents)
    contents = %(
      <?xml version="1.0" encoding="UTF-8"?>
      <rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">
        <channel>#{inner_contents}</channel>
      </rss>
    )

    Nokogiri::XML(contents)
  end
end
