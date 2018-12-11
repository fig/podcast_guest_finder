require 'rails_helper'

RSpec.describe RSSFeedEpisode do
  describe '#content' do
    context 'the element exists' do
      before do
        contents = %(
          <?xml version="1.0" encoding="UTF-8"?>
          <rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">
            <channel>
              <item>
                <title>My Episode</title>
              </item>
            </channel>
          </rss>
        )

        xml_doc = Nokogiri::XML(contents)
        episode_element = xml_doc.xpath('//item').first
        @rss_feed_episode = RSSFeedEpisode.new(episode_element)
      end

      it 'parses the title' do
        expect(@rss_feed_episode.content('title')).to eq('My Episode')
      end
    end

    context 'the element does not exist' do
      before do
        contents = %(
          <?xml version="1.0" encoding="UTF-8"?>
          <rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">
            <channel>
              <item></item>
            </channel>
          </rss>
        )

        xml_doc = Nokogiri::XML(contents)
        episode_element = xml_doc.xpath('//item').first
        @rss_feed_episode = RSSFeedEpisode.new(episode_element)
      end

      it 'returns an empty string' do
        expect(@rss_feed_episode.content('title')).to eq('')
      end
    end
  end
end
