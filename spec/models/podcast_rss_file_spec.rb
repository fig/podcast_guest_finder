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
end
