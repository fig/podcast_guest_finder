class Show < ApplicationRecord
  has_many :episodes
  validates :name, presence: true
  validates :xml_feed_url,
    presence: true,
    format: URI::regexp(%w(http https))

  def parse_rss_file
    PodcastRSSFile.new(
      show: self,
      contents: xml_feed_contents
    ).consume!
  end

  def xml_feed_contents
    Net::HTTP.get(URI.parse(xml_feed_url))
  end
end
