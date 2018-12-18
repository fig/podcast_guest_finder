require 'rails_helper'

RSpec.describe RSSFeedEpisode do
  describe '#content' do
    context 'the element exists' do
      let(:xml_doc) do
        RSSFeedEpisodeTestFactory.create(
          "<item><title>My Episode</title></item>"
        )
      end

      let(:rss_feed_episode) do
        RSSFeedEpisode.new(xml_doc.xpath('//item').first)
      end

      it 'parses the title' do
        expect(rss_feed_episode.content('title')).to eq('My Episode')
      end
    end

    context 'the element does not exist' do
      let(:xml_doc) do
        RSSFeedEpisodeTestFactory.create("<item></item>")
      end

      let(:rss_feed_episode) do
        RSSFeedEpisode.new(xml_doc.xpath('//item').first)
      end

      it 'returns an empty string' do
        expect(rss_feed_episode.content('title')).to eq('')
      end
    end
  end
end
