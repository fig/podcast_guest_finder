require 'rails_helper'

RSpec.describe Show, type: :model do
  subject { build(:show) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:xml_feed_url) }

  describe 'XML feed parsing' do
    it 'gets parsed upon show creation' do
      show = Show.new(
        name: 'The Tim Ferriss Show',
        xml_feed_url: 'https://rss.art19.com/tim-ferriss-show'
      )

      expect { show.save_and_parse! }.to change {
        show.episodes.count
      }.from(0).to(349)
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
