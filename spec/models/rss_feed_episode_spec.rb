require 'rails_helper'

RSpec.describe RSSFeedEpisode do
  describe '#content' do
    context 'the element exists' do
      let(:xml_doc) do
        RSSFeedEpisodeTestFactory.create(
          %(
            <title>My Podcast</title>
            <item>
              <title>My Episode</title>
            </item>
          )
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

  describe 'show notes' do
    let(:xml_doc) do
      RSSFeedEpisodeTestFactory.create(
        %(
          <item>
            <content:encoded>
              <![CDATA[<p>Me and Chris touched on about a billion topics in this episode including integration tests vs. unit tests, DRY in testing, dependency injection, Cucumber, and security.</p>

              <p>Links:</p>

              <ul>
              <li><a href="https://gorails.com/">GoRails</a></li>
              <li><a href="https://www.hatchbox.io/">HatchBox</a></li>
              <li><a href="https://remoteruby.transistor.fm/">Remote Ruby Podcast</a></li>
              </ul>

              ]]>
            </content:encoded>
          </item>
        )
      )
    end

    let(:rss_feed_episode) do
      RSSFeedEpisode.new(xml_doc.xpath('//item').first)
    end

    it 'returns an empty string' do
      content = rss_feed_episode.content('content|encoded')[0..41]
      expect_content = '<p>Me and Chris touched on about a billion'

      expect(content).to eq(expect_content)
    end
  end
end
