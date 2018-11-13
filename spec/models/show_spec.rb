require 'rails_helper'

RSpec.describe Show, type: :model do
  subject { build(:show) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:xml_feed_url) }

  describe 'XML feed parsing' do
    let(:filename) do
      Rails.root.join('spec', 'files', 'ruby_testing_podcast.xml')
    end

    let(:xml_feed_contents) { File.read(filename) }

    let(:show) do
      Show.new(
        name: 'The Ruby Testing Podcast',
        xml_feed_url: 'https://example.com/rss'
      )
    end

    it 'gets parsed upon show creation' do
      expect { show.save_and_parse!(xml_feed_contents) }.to change {
        show.episodes.count
      }.from(0).to(15)
    end
  end

  describe 'xml_feed_url validity' do
    describe 'invalid URL' do
      before do
        subject.xml_feed_url = 'blah'
        subject.save
      end

      it 'is not valid' do
        expect(subject.errors[:xml_feed_url]).to include('is invalid')
      end
    end

    describe 'valid URL' do
      before do
        subject.xml_feed_url = 'https://rss.simplecast.com/podcasts/5739/rss'
        subject.save
      end

      it { should be_valid }
    end
  end
end
