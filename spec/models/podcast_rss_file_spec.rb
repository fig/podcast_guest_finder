require 'rails_helper'

RSpec.describe PodcastRSSFile do
  let(:filename) do
    Rails.root.join('spec', 'files', 'ruby_testing_podcast.xml')
  end

  let(:podcast_rss_file) do
    PodcastRSSFile.new(
      show: create(:show),
      contents: File.read(filename)
    )
  end

  it 'saves episodes' do
    expected_episode_name = '014 - Chris Oliver, Creator of GoRails'

    expect { podcast_rss_file.consume! }.to change {
      Episode.exists?(name: expected_episode_name)
    }.from(false).to(true)
  end

  describe 'parsed attributes' do
    before { podcast_rss_file.consume! }

    let(:episode) do
      Episode.find_by(name: '014 - Chris Oliver, Creator of GoRails')
    end

    it 'parses attributes' do
      expect(episode.link).to eq('http://www.rubytestingpodcast.com/chris-oliver')
      expect(episode.description).to eq('Me and Chris touched on about a billion topics in this episode including integration tests vs. unit tests, DRY in testing, dependency injection, Cucumber, and security.')
    end
  end
end
